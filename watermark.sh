#!/usr/bin/env bash

set -e

source="${1}"
watermark="${2}"
target="${@: -1}"
type="${3}"

extension="${source##*.}"

if [[ ! "${target}" ]]; then
  target="${source##*/}" # leave only last component of path
  target="${target%.*}"  # strip extension
fi
mkdir -p ${target}

case ${type} in 
        "top-left")
        # watermark at top left
        ffmpeg -i ${source} -i ${watermark} -filter_complex "overlay=10:10" ${target}/${target}_left.${extension}
        Message="Completed !"
        ;;
        "center")
        # center watermark
        ffmpeg -i ${source} -i ${watermark} \
        -filter_complex "overlay=x=(main_w-overlay_w)/2:y=(main_h-overlay_h)/2" ${target}/${target}_center.${extension}
        Message="Completed !"
        ;;
        "animated")
        # animated watermark
        ffmpeg -i ${source} -i ${watermark} \
        -filter_complex "overlay='if(gte(t,1), -w+(t-1)*200, NAN)':(main_h-overlay_h)/2" ${target}/${target}_animated.${extension}
        Message="Completed !"
        ;;
        "padding")   
        # add padding and add watermark on padding without covering the video
        ffmpeg -i ${source} -i ${watermark} \
        -filter_complex "pad=height=ih+40:color=#71cbf4,overlay=(main_w-overlay_w)/2:main_h-overlay_h" \
        ${target}/${target}_padding.${extension}
        Message="Completed !"
        ;;
        *)
        Message="Invalid option selected"
        ;;
        esac

echo $Message






