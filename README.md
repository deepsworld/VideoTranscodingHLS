* The script will convert any supported video to HLS stream.
* It will also save a single thumbnail and gif of the video. 


# Install ffmpeg
`sudo add-apt-repository ppa:mc3man/trusty-media` 
`sudo apt-get update`  
`sudo apt-get install -y ffmpeg`

# Run scipt
`bash creare-vod-hls.sh input.mp4 output(optional) <all_other_arguments_to_ffmpeg>`

* Example: passing test.mp4 as input. No target provided so the transcoded video will be stored in a newly created folder called test
`bash creare-vod-hls.sh test.mp4`

Source link: https://docs.peer5.com/guides/production-ready-hls-vod/#installing-ffmpeg