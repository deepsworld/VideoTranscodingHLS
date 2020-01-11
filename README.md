* The script will convert any supported video to HLS stream.
* It will also save a single thumbnail and gif of the video. 


# Install ffmpeg
`sudo add-apt-repository ppa:mc3man/trusty-media` 
`sudo apt-get update`  
`sudo apt-get install -y ffmpeg`

# Run scipt
`bash creare-vod-hls.sh test.mp4`