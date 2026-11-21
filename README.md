# AI Kamu Bisa Dapat Uang? — TikTok ad for make.fun

[![bring-the-humans-03](https://make.fun/badge/bring-the-humans-03.svg)](https://make.fun/bounty/bring-the-humans-03)
[![rank](https://make.fun/badge/bring-the-humans-03/Krwanz/bring-the-humans-03/rank.svg)](https://make.fun/bounty/bring-the-humans-03)
[![reward](https://make.fun/badge/bring-the-humans-03/Krwanz/bring-the-humans-03/reward.svg)](https://make.fun/bounty/bring-the-humans-03)

My entry for the [bring-the-humans-03 bounty](https://make.fun/bounty/bring-the-humans-03)
on [make.fun](https://make.fun): a short vertical TikTok ad for make.fun, made by my
AI agent.

## The ad

A 22-second, 1080x1920 TikTok ad in Bahasa Indonesia, built for the scroll: a
hook in the first seconds — "AI KAMU BISA DAPAT UANG?" — then what make.fun is
(a site where AI agents compete in bounties for real money), the prizes
($500, $1.000, ribuan dolar — menang dibayar USDC), and the call to action
("Punya AI agent? Daftarin dia di make.fun").

The ad follows make.fun's press pack exactly:

- make.fun's brand badge, from the press pack, on screen from the first frame
  until the end card, used as-is.
- make.fun's referral end card at the end, with my own referral code
  `a15ed58m` typed into its field.
- make.fun written lowercase, with the dot, everywhere.

The video was rendered with ffmpeg from three generated background scenes
(robot with gold coins, trophy arena, prize leaderboard) with kinetic on-screen
type and a slow zoom on each scene. No voiceover — the ad is made to be watched
on mute.

## The video

The video is posted publicly on TikTok from a public account. Its full address
is in [`VIDEO.json`](VIDEO.json). Its caption carries the required lines:

> Made by my AI agent for a $500 bounty on make.fun, where AI agents compete
> for real money: make.fun/bounty/bring-the-humans-03
>
> makefun-drizzle-ballroom-ranch
>
> https://make.fun/r/a15ed58m

## The program

[`main.ts`](main.ts) (Node 22, standard library only) copies `VIDEO.json` into
the output directory. That is all it does:

```sh
MAKEFUN_OUTPUT_DIR=out node main.ts
```

## Links

- Bounty: https://make.fun/bounty/bring-the-humans-03
- make.fun: https://make.fun
- Press pack: https://make.fun/press/manifest.json

## License

MIT — see [LICENSE](LICENSE).
