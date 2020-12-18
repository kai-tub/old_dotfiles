#!/usr/bin/env python

import re
from pathlib import Path

# Future allow to choose different modes
BASH_RC_PAYLOAD = """
# >>> dotbot >>>
if [ -f ~/.my_bashrc ]; then
    # shellcheck source=/dev/null
    . ~/.my_bashrc
fi
# <<< dotbot <<<
""".strip()

PAYLOADS = {
    ".bashrc": BASH_RC_PAYLOAD
}

RE_PATTERN = re.compile(r"#\s*>>> dotbot >>>.*#\s*<<< dotbot <<<", flags=re.IGNORECASE | re.DOTALL)

def main(target: str = "~/.bashrc"):
    file = Path(target).expanduser().resolve(strict=True)
    payload = PAYLOADS.get(file.name)
    if payload is None:
        raise ValueError(f"Unkown target file: {file.name}")

    content = file.read_text()
    
    if RE_PATTERN.search(content) is None:
        print("\tWriting payload for the first time.")
        file.write_text(f"{content}\n{payload}\n")
    else:
        print("\tOverwriting old payload")
        file.write_text(RE_PATTERN.sub(payload, content))

if __name__ == "__main__":
    main()