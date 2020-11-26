function mov_to_gif {
 ffmpeg -i $1.mov -s 800x600 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=7 > $1.gif 
}
