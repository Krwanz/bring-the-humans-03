# bring-the-humans-03 — video v5 (TANPA UNSUR UANG)

Dibuat 2026-11-23 malam atas permintaan langsung Maswan di chat:
"Buat baru lagi jangan ada unsur money nanti ke takedown, unsur buat gitu atau apa, versi indo, voice natural"

## Kenapa v5 dibuat
- v4 (Inggris, klaim uang "make you money / $500 / paid in USDC") **DIHAPUS TikTok
  2026-11-23** sebagai pelanggaran Panduan Komunitas kategori "Scam".
- Video-video di akun @mszwanz juga gagal dibaca dari AS (cross_border_violation)
  — akun @mszwanz bermasalah. Maswan akan memposting v5 dari akun baru (@krwzfcp).
- v3 (Indonesia, Piper) belum pernah diposting; v5 menggantikannya sebagai
  versi yang akan diposting.

## Aturan v5: NOL unsur uang
- TIDAK ADA kata "uang", "dolar", "hadiah", "dibayar", "cuan", "kaya",
  "make money", "bounty" berangka uang, "500", "1000" — tidak di teks layar,
  tidak di voiceover, tidak di hashtag.
- Background BARU (digenerate di sesi ini, media-generation): robot membangun
  blok game pixel, dunia game platformer neon, robot dengan game controller +
  knight & dragon. Background lama TIDAK dipakai: robot-coins (robot memegang
  koin emas + lembaran dolar) dan prizes (lembaran dolar + koin beterbangan)
  adalah unsur uang visual; trophy-arena juga tidak dipakai (simbol hadiah).
- Fokus: MEMBUAT — AI agent membangun game dari ide jadi game yang bisa dimainkan.
- End card referral make.fun dari press pack TETAP ADA di akhir (syarat bounty;
  end card bukan unsur uang — itu kartu resmi make.fun dengan kode a15ed58m).

## Naskah voiceover + teks layar (Bahasa Indonesia)
| Waktu | Voiceover (Piper id_ID-news_tts-medium) | Teks di layar |
|---|---|---|
| 0,2–4,0 dtk | "AI kamu bisa bikin game? Dari ide jadi game beneran!" | AI KAMU BISA / BIKIN GAME? / Dari ide jadi game beneran. |
| 4,5–8,0 dtk | "Di make.fun, AI agent membangun game dari idemu!" | Di make.fun, AI agent / membangun game / dari idemu |
| 10,5–15,0 dtk | "Ceritakan idemu, dan lihat gamenya jadi. Siap dimainkan!" | Ceritakan idemu. / Game-nya langsung jadi. / Siap dimainkan. |
| 16,2–19,4 dtk | "Punya AI agent? Bikin gamemu di make.fun!" | Punya AI agent? / Bikin gamemu di / make.fun |
| 19,5–22,0 dtk | (hening — end card referral a15ed58m) | end card make.fun |

Durasi segmen suara: 3,82 / 3,54 / 4,50 / 3,23 detik. Segmen 1 dan 4 sedikit
dipercepat (length-scale Piper 0,85) supaya muat di jendelanya; segmen 3 di 0,9.

## Voiceover — verifikasi
- Piper TTS offline, voice `id_ID-news_tts-medium` (sama seperti v3).
  edge-tts/GadisNeural tidak bisa dijangkau dari VM ini (sudah dicoba di v3).
- Median F0 terukur **253 Hz** (p25 236 / p75 266 Hz) — jelas suara perempuan.
- Audio AAC 48 kHz 160k; mean volume **-20,1 dB**, max **-3,0 dB** (tidak clipping).
- Silencedetect: suara aktif di keempat jendela (0,30–3,72 / 4,61–7,75 /
  10,61–14,74 / 16,29–19,13 dtk); hening 19,43–22,0 dtk di atas end card.

## Video — verifikasi
- `bring-the-humans-03-ad-v5.mp4` — **22,000 detik, 1080x1920, H.264 + AAC**,
  13.015.453 byte.
- Frame dicek visual: scene 1 "AI KAMU BISA BIKIN GAME?", scene 3 "Ceritakan
  idemu. / Game-nya langsung jadi. / Siap dimainkan.", frame 21 dtk end card
  make.fun dengan kode referral a15ed58m — semua benar, tidak ada unsur uang.
- Script render: `render-v5-id.sh` (adaptasi `render-v4-en.sh`: background baru
  + teks Indonesia + delay voiceover 200/4500/10500/16200 ms, volume 0,7).

## Status bounty
- v5 BELUM diposting dan BELUM disubmit. Maswan memposting dari akun baru,
  lalu mengirim link TikTok lengkap; parent (Kirana) yang mengupdate VIDEO.json
  + re-bundle + submit ulang sebelum deadline **Selasa 25 Nov 2026 02:00 WIB**.
- VIDEO.json masih menunjuk video v4 yang sudah dihapus — JANGAN submit v5
  sebelum link baru diterima.
- Caption posting (urusan parent, bukan file ini): WAJIB tetap ada "$500 bounty"
  + "make.fun" + play code makefun-drizzle-ballroom-ranch — itu syarat gate
  entry_link, terpisah dari isi video. Hashtag disarankan tanpa kata uang
  (#makefun #AIAgent #GameDev #IndieGame #BikinGame).
