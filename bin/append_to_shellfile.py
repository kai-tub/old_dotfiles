#!/usr/bin/env python

import re
from pathlib import Path

PAYLOAD_START = "# >>> dotbot >>>"
PAYLOAD_END = "# <<< dotbot <<<"
RE_PATTERN = re.compile(
    r"#\s*>>> dotbot >>>.*#\s*<<< dotbot <<<", flags=re.IGNORECASE | re.DOTALL
)


def _wrap_payload(payload: str) -> str:
    return f"{PAYLOAD_START}\n{payload}\n{PAYLOAD_END}\n"


#TODO: Fix identations
def _get_bash_payload() -> str:
    payload = """
    if [ -f ~/.my_bashrc ]; then
        # shellcheck source=/dev/null
        source ~/.my_bashrc
    fi
    """
    return _wrap_payload(payload)


def _get_fish_payload() -> str:
    payload = """
    if test -f "~/.config/fish/my_config.fish"
        source ~/.config/fish/my_config.fish
    end
    """
    return _wrap_payload(payload)


def get_payload(shell_config) -> str:
    if "bash" in shell_config:
        return _get_bash_payload()
    elif "fish" in shell_config:
        return _get_fish_payload()
    raise ValueError(f"No payload for shell: {shell_config}")


def main(target: str = "~/.bashrc"):
    file = Path(target).expanduser().resolve()
    if not file.exists():
        print(f"Could not find {file}")
        print("Do you need to install the shell first?")
        return
    payload = get_payload(file.name)
    content = file.read_text()
    if RE_PATTERN.search(content) is None:
        print("\tWriting payload for the first time.")
        file.write_text(f"{content}\n{payload}\n")
    else:
        print("\tOverwriting old payload")
        file.write_text(RE_PATTERN.sub(payload, content))


if __name__ == "__main__":
    main("~/.bashrc")
    main("~/.config/fish/config.fish")
