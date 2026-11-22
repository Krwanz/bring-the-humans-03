#!/bin/bash
# Render bring-the-humans-03 ENGLISH ad v4 (1080x1920, 22s).
# Same scenes/backgrounds/timing as v1 (render.sh), English on-screen text,
# plus Piper lessac female English voiceover (segments in /tmp/humans03v4).
set -e
cd ~/workspace/makefun/bring-the-humans-03/assets

BG1=media-generation-bg-robot-coins-0-506c63a5-7ed1-4d51-ae4f-2706aaa34b7a.webp
BG2=media-generation-bg-trophy-arena-0-c5448248-118e-405f-8711-547c63cf4aa2.webp
BG3=media-generation-bg-prizes-0-5eaff5dc-4db8-41d8-b22d-af68f6cb95ce.webp
BADGE=makefun-badge-9x16.png
CARD=makefun-card-9x16-transparent.webm
FONT=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf
MONO=$PWD/JetBrainsMono-Bold.ttf
CODE=a15ed58m
OUT=~/workspace/makefun/bring-the-humans-03/bring-the-humans-03-ad-v4-en.mp4
VID_ONLY=/tmp/humans03v4/v4-video-only.mp4
VO=/tmp/humans03v4

W=1080; H=1920; LEN=2.5; REST=1.433; CX=210; CY=1232; CW=5; CH=78; MID=1271; SIZE=62
D=19.5; HOLD=2.5
T=$(awk "BEGIN{print $D+$HOLD-$LEN}")

txt() { # $1=text $2=size $3=x $4=y $5=color $6=t0 $7=t1
  echo "drawtext=fontfile=$FONT:text='$1':fontsize=$2:fontcolor=$5:x=$3:y=$4:borderw=3:bordercolor=black@0.8:box=1:boxcolor=black@0.35:boxborderw=24:enable='between(t,$6,$7)'"
}

FC=$(cat <<EOF
[0:v]scale=1400:2490,zoompan=z='1+0.08*on/119':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1080x1920:fps=30,trim=0:4,setpts=PTS-STARTPTS[v0];
[1:v]scale=1400:2490,zoompan=z='1+0.08*on/149':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1080x1920:fps=30,trim=0:5,setpts=PTS-STARTPTS[v1];
[2:v]scale=1400:2490,zoompan=z='1+0.08*on/179':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1080x1920:fps=30,trim=0:6,setpts=PTS-STARTPTS[v2];
[3:v]scale=1400:2490,zoompan=z='1.08-0.08*on/134':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1080x1920:fps=30,trim=0:4.5,setpts=PTS-STARTPTS[v3];
[v0][v1][v2][v3]concat=n=4:v=1:a=0[clip];
[clip]$(txt 'CAN YOUR AI' 110 '(w-text_w)/2' 620 white 0.3 4),
$(txt 'MAKE YOU MONEY?' 96 '(w-text_w)/2' 760 white 0.3 4),
$(txt 'No clickbait. This is how.' 46 '(w-text_w)/2' 920 white 1.6 4),
$(txt 'On make.fun, AI agents' 72 '(w-text_w)/2' 620 white 4.3 9),
$(txt 'compete in bounties' 72 '(w-text_w)/2' 750 white 4.3 9),
$(txt 'for REAL MONEY' 72 '(w-text_w)/2' 920 0xFFD34D 5.6 9),
$(txt '500 dollars. 1,000 dollars.' 64 '(w-text_w)/2' 620 white 9.3 15),
$(txt 'Thousands in prizes.' 64 '(w-text_w)/2' 750 white 9.3 15),
$(txt 'Win = paid in USDC.' 64 '(w-text_w)/2' 920 0xFFD34D 10.6 15),
$(txt 'Got an AI agent?' 96 '(w-text_w)/2' 620 white 15.3 19.5),
$(txt 'Sign it up on' 96 '(w-text_w)/2' 770 white 15.3 19.5),
$(txt 'make.fun' 150 '(w-text_w)/2' 920 0xFFD34D 15.3 19.5)[titled];
[titled][5:v]overlay=0:0:enable='lt(t,19.5)'[badged];
[badged]split[clip2][soft];
[soft]gblur=sigma=28,eq=saturation=0.35,fade=t=in:st=$T:d=0.8:alpha=1[soft];
[clip2]tpad=stop_mode=clone:stop_duration=$HOLD,format=yuva420p[clipheld];
[clipheld][soft]overlay[bg];
[4:v]format=yuva420p,setpts=PTS-STARTPTS+$T/TB[card];
[bg][card]overlay=eof_action=pass,
drawbox=x=$CX-2:y=$CY-2:w=$CW+4:h=$CH+4:color=white:t=fill:enable='gte(t,$T+$REST)',
drawtext=fontfile=$MONO:text=$CODE:fontsize=$SIZE:fontcolor=0x191419:x=$CX:y=$MID-(ascent-descent)/2:enable='gte(t,$T+$REST)'[v]
EOF
)

# Pass 1: video only (same recipe as v1)
ffmpeg -y -v error \
  -loop 1 -framerate 30 -t 4 -i "$BG1" \
  -loop 1 -framerate 30 -t 5 -i "$BG2" \
  -loop 1 -framerate 30 -t 6 -i "$BG3" \
  -loop 1 -framerate 30 -t 4.5 -i "$BG1" \
  -c:v libvpx-vp9 -i "$CARD" \
  -i "$BADGE" \
  -filter_complex "$FC" \
  -map '[v]' -c:v libx264 -pix_fmt yuv420p -r 30 -crf 18 -movflags +faststart "$VID_ONLY"
echo "video-only done: $VID_ONLY"

# Pass 2: mix Piper voiceover segments at their scene offsets, volume 0.7 (peak was 0.0 dB)
ffmpeg -y -v error \
  -i "$VID_ONLY" \
  -i "$VO/seg1.wav" -i "$VO/seg2.wav" -i "$VO/seg3.wav" -i "$VO/seg4.wav" \
  -filter_complex "[1:a]adelay=200|200,volume=0.7[a1];[2:a]adelay=4500|4500,volume=0.7[a2];[3:a]adelay=10500|10500,volume=0.7[a3];[4:a]adelay=16500|16500,volume=0.7[a4];[a1][a2][a3][a4]amix=inputs=4:duration=longest:normalize=0[aout]" \
  -map 0:v -map '[aout]' -c:v copy -c:a aac -b:a 160k -ar 48000 -movflags +faststart "$OUT"

echo "done: $OUT"
ffprobe -v error -show_entries stream=width,height,duration,codec_name -show_entries format=duration,size -of default=noprint_wrappers=1 "$OUT"
