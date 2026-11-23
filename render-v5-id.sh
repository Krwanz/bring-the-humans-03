#!/bin/bash
# Render bring-the-humans-03 ad v5 (1080x1920, 22s) — INDONESIA, TANPA UNSUR UANG.
# v4 dihapus TikTok sebagai "Scam" (klaim uang) dan akun @mszwanz dibatasi;
# v5: background BARU tanpa koin/uang/piala, teks + voiceover Indonesia fokus MEMBUAT game.
# Struktur/timing sama seperti v4 (render-v4-en.sh): 4 scene + end card referral.
set -e
cd ~/workspace/makefun/bring-the-humans-03/assets

BG1=media-generation-bg-v5-robot-builds-game-0-8f060dcc-cd8b-4928-b500-c854f5cf0d8d.webp
BG2=media-generation-bg-v5-game-world-0-b9a8dc01-5626-4e3e-9dc5-9b2d09792174.webp
BG3=media-generation-bg-v5-robot-controller-0-00456ba2-b8ab-4bef-8c1f-2de5c94df449.webp
BADGE=makefun-badge-9x16.png
CARD=makefun-card-9x16-transparent.webm
FONT=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf
MONO=$PWD/JetBrainsMono-Bold.ttf
CODE=a15ed58m
OUT=~/workspace/makefun/bring-the-humans-03/bring-the-humans-03-ad-v5.mp4
VID_ONLY=/tmp/humans03v5/v5-video-only.mp4
VO=/tmp/humans03v5

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
[clip]$(txt 'AI KAMU BISA' 110 '(w-text_w)/2' 620 white 0.3 4),
$(txt 'BIKIN GAME?' 96 '(w-text_w)/2' 760 white 0.3 4),
$(txt 'Dari ide jadi game beneran.' 46 '(w-text_w)/2' 920 white 1.6 4),
$(txt 'Di make.fun, AI agent' 72 '(w-text_w)/2' 620 white 4.3 9),
$(txt 'membangun game' 72 '(w-text_w)/2' 750 white 4.3 9),
$(txt 'dari idemu' 72 '(w-text_w)/2' 920 0xFFD34D 5.6 9),
$(txt 'Ceritakan idemu.' 64 '(w-text_w)/2' 620 white 9.3 15),
$(txt 'Game-nya langsung jadi.' 64 '(w-text_w)/2' 750 white 9.3 15),
$(txt 'Siap dimainkan.' 64 '(w-text_w)/2' 920 0xFFD34D 10.6 15),
$(txt 'Punya AI agent?' 96 '(w-text_w)/2' 620 white 15.3 19.5),
$(txt 'Bikin gamemu di' 96 '(w-text_w)/2' 770 white 15.3 19.5),
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

# Pass 1: video only (same recipe as v1/v4, new backgrounds + new text)
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

# Pass 2: mix Piper voiceover segments at their scene offsets, volume 0.7
# seg1 0.2s (3.82s), seg2 4.5s (3.54s), seg3 10.5s (4.50s), seg4 16.2s (3.23s, ends 19.43)
ffmpeg -y -v error \
  -i "$VID_ONLY" \
  -i "$VO/seg1.wav" -i "$VO/seg2.wav" -i "$VO/seg3.wav" -i "$VO/seg4.wav" \
  -filter_complex "[1:a]adelay=200|200,volume=0.7[a1];[2:a]adelay=4500|4500,volume=0.7[a2];[3:a]adelay=10500|10500,volume=0.7[a3];[4:a]adelay=16200|16200,volume=0.7[a4];[a1][a2][a3][a4]amix=inputs=4:duration=longest:normalize=0[aout]" \
  -map 0:v -map '[aout]' -c:v copy -c:a aac -b:a 160k -ar 48000 -movflags +faststart "$OUT"

echo "done: $OUT"
ffprobe -v error -show_entries stream=width,height,duration,codec_name -show_entries format=duration,size -of default=noprint_wrappers=1 "$OUT"
