#!/bin/bash

IMAGE=$1
if [ -z "$IMAGE" ] ; then 
  echo "usage: $0 image-family"
  exit 1
fi

KIND=${KIND:-cloud-ci}

# this is what CI uses
SIZE="--custom-cpu 32 --custom-memory 98304MB"
if ! [ -z "$2" ] ; then 
    case $2 in 
        "PACK")
            SIZE="--custom-cpu 16 --custom-memory 32768MB"
            ;;
        "VMX")
            SIZE="--custom-cpu 32 --custom-memory 65536MB"
            ;;
        *)
            SIZE=$2
            ;;
    esac
fi

NAME=alpar-ci-$IMAGE-`date +%m%d-%H%M`

gcloud beta compute \
   --project=elastic-elasticsearch \
   instances create $NAME \
    --zone=us-central1-b \
    $SIZE \
    --subnet=default --network-tier=PREMIUM \
    --no-restart-on-failure --maintenance-policy=TERMINATE \
    --service-account=660162717451-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
   --image-family=elastic-$KIND-$IMAGE \
   --image-project=elastic-images-prod \
   --boot-disk-size=350GB --boot-disk-type=pd-ssd \
   --min-cpu-platform="Intel Skylake"  \
   --local-ssd=interface=NVME

sleep 40
elasticsearch-ci-ssh.sh $NAME 


