// Entry program for the bring-the-humans-03 bounty on make.fun.
//
// The entry is a TikTok video ad for make.fun. This program does exactly one
// thing: it copies VIDEO.json, which names the video's full address on TikTok,
// into the output directory the harness provides. It needs no network and
// uses only the Node.js standard library.

import { copyFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const outDir = process.env.MAKEFUN_OUTPUT_DIR ?? "out";

mkdirSync(outDir, { recursive: true });
copyFileSync(join(here, "VIDEO.json"), join(outDir, "VIDEO.json"));

console.log("VIDEO.json copied to " + outDir);
