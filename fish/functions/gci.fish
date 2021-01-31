function gci --description "Create google instance"
    set args "i/image-family=" "z/zone=" "n/instance-name=" "t/instance-type="
    argparse --name="google-cloud-instance_creator" $args -- $argv
    if test -z "$_flag_image_family"
        set _flag_image_family "pytorch-latest-gpu"
    end

    if test -z "$_flag_zone"
        set _flag_zone "us-central1-f"
    end

    if test -z "$_flag_instance_name"
        set _flag_instance_name "my-fastai-instance"
    end

    if test -z "$_flag_instance_type"
        set _flag_instance_type "n1-highmem-8"
    end

    gcloud compute instances create "$_flag_instance_name" \
        --zone="$_flag_zone" \
        --image-family="$_flag_image_family" \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-p100,count=1" \
        --machine-type="$_flag_instance_type" \
        --boot-disk-size=200GB \
        --metadata="install-nvidia-driver=True" \
        --preemptible

end
