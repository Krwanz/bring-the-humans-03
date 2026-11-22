# bring-the-humans-03 — revoice v2 (suara cewek)

Dibuat 2026-11-23 ~05:15 WIB atas permintaan langsung Maswan di chat:
"ada suara cewek, terus bisa menarik banyak view".
Video v1 tidak punya track audio sama sekali — v2 menambahkan voiceover
perempuan berbahasa Indonesia (gTTS id) tanpa mengubah visual apa pun.

## File
- `bring-the-humans-03-ad-v2.mp4` — 22.00 detik, 1080x1920, H.264 + AAC 160k,
  11.645.445 byte. Video stream MD5 IDENTIK dengan v1
  (ac0361b07c7115991cdff65d17a42843) — visual tidak di-re-encode, hanya audio
  ditambahkan. File v1 (`bring-the-humans-03-ad.mp4`) TIDAK ditimpa.

## Naskah voiceover (gTTS bahasa Indonesia, tempo 1.08x — sedikit lebih cepat, energik)
Segmen dipasang mengikuti beat visual (teks yang tampil di layar):

| Waktu | Visual di layar | Voiceover |
|---|---|---|
| 0.2–3.9 dtk | "AI KAMU BISA DAPAT UANG?" | "AI kamu bisa dapat uang? Bukan clickbait!" |
| 4.5–10.1 dtk | "Di make.fun, AI agent saling lomba di bounty, hadiahnya UANG ASLI" | "Di make.fun, AI agent lomba bounty, hadiahnya uang asli!" |
| 10.5–15.9 dtk | "500 dolar. 1.000 dolar. Ribuan dolar hadiahnya. Menang = dibayar USDC." | "Lima ratus, seribu dolar, menang langsung dibayar USDC!" |
| 16.5–20.5 dtk | "Punya AI agent? Daftarin dia di make.fun" | "Punya AI agent? Daftarin di make.fun!" |
| 20.0–22.0 dtk | End card referral a15ed58m | (hening — end card) |

## Verifikasi (ffprobe/ffmpeg)
- Durasi total 22.000 dtk; video 1080x1920 H.264; audio AAC 21.84 dtk.
- Audio decode OK; mean volume -20.5 dB, max -3.5 dB (tidak clipping).
- Silencedetect: suara aktif 0.2–3.6, 4.6–9.3, 10.6–15.1, 16.6–20.1 dtk —
  sesuai beat visual; hening 20.1–22.0 dtk di end card.
- Video stream MD5 v1 == v2 (visual byte-identik).

## Status bounty
- v2 adalah video yang harus diposting Maswan (menggantikan v1).
- Caption wajib (sama seperti v1, tidak berubah): harus ada "$500 bounty" DAN
  "make.fun", play code makefun-drizzle-ballroom-ranch, referral
  https://make.fun/r/a15ed58m.
- VIDEO.json masih placeholder — JANGAN submit; submit hanya setelah Maswan
  posting v2 dan mengirim link TikTok lengkap.
- Deadline posting: 25 Nov 2026 02:00 WIB. Video harus tetap publik sampai
  hasil keluar 9 Des 2026.
