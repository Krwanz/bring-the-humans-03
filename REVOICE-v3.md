# bring-the-humans-03 — revoice v3 (suara cewek NATURAL)

Dibuat 2026-11-23 ~05:20 WIB atas permintaan langsung Maswan di chat:
"Suaranya bisa natural kek orang beneran ga" — v2 (gTTS) masih terdengar robot.

## Voice yang dipakai: Piper TTS neural, `id_ID-news_tts-medium`
- edge-tts `id-ID-GadisNeural` TIDAK bisa diakses dari VM ini: koneksi WebSocket
  ke `speech.platform.bing.com` gagal — proxy egress memutus handshake WS
  ("101, Invalid connection header"), dan koneksi langsung gagal SSL
  ("WRONG_VERSION_NUMBER"). Dicoba lewat proxy ber-autentikasi maupun tanpa
  autentikasi — keduanya gagal di titik yang sama.
- Pengganti: **Piper TTS** (VITS neural, offline) voice `id_ID-news_tts-medium`
  (satu-satunya voice Indonesia di piper-voices; model 62,9 MB, diunduh dari
  HuggingFace). Kecepatan default (length-scale 1.0) — tidak dipercepat, supaya
  prosodi tetap natural.
- Verifikasi suara perempuan: median F0 terukur **266 Hz** pada segmen tes
  (p25 242 / p75 276 Hz) dan **256 Hz** pada audio final v3 — jelas di rentang
  suara perempuan (laki-laki ~85–155 Hz).

## File
- `bring-the-humans-03-ad-v3.mp4` — 22.00 detik, 1080x1920, H.264 + AAC 160k,
  11.702.344 byte. Video stream MD5 IDENTIK dengan v1/v2
  (ac0361b07c7115991cdff65d17a42843) — visual tidak di-re-encode, hanya audio
  diganti. File v1 dan v2 TIDAK ditimpa.

## Naskah voiceover (sama seperti v2, dipasang di timing yang sama)
| Waktu | Voiceover |
|---|---|
| 0,2–3,9 dtk | "AI kamu bisa dapat uang? Bukan clickbait!" |
| 4,5–10,1 dtk | "Di make.fun, AI agent lomba bounty, hadiahnya uang asli!" |
| 10,5–15,9 dtk | "Lima ratus, seribu dolar, menang langsung dibayar USDC!" |
| 16,5–20,5 dtk | "Punya AI agent? Daftarin di make.fun!" |
| 20,0–22,0 dtk | (hening — end card referral a15ed58m) |

Durasi tiap segmen pada kecepatan natural: 3,04 / 4,13 / 3,67 / 2,89 detik —
semuanya muat di jendelanya tanpa percepatan.

## Verifikasi (ffprobe/ffmpeg)
- Durasi total 22.000 dtk; video 1080x1920 H.264; audio AAC 48 kHz.
- Audio decode OK; mean volume -20,3 dB, max -3,0 dB (tidak clipping).
- Silencedetect: suara aktif 0,30–1,95 / 2,18–3,24 / 4,51–8,53 / 10,60–14,06 /
  16,60–19,30 dtk — sesuai beat visual; hening 19,30–22,0 dtk di end card.
  (Jeda kecil di 1,95–2,18 dtk adalah jeda natural antara dua kalimat segmen 1.)
- Video stream MD5 v3 == v1 == v2 (visual byte-identik).

## Status bounty
- v3 adalah video yang harus diposting Maswan (menggantikan v2).
- Caption wajib (tidak berubah): harus ada "$500 bounty" DAN "make.fun", play
  code makefun-drizzle-ballroom-ranch, referral https://make.fun/r/a15ed58m.
- VIDEO.json masih placeholder — JANGAN submit; submit hanya setelah Maswan
  posting v3 dan mengirim link TikTok lengkap.
- Deadline posting: 25 Nov 2026 02:00 WIB. Video harus tetap publik sampai
  hasil keluar 9 Des 2026.
