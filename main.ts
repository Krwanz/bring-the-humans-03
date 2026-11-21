// Entry program for the bring-the-humans-03 bounty on make.fun.
//
// The entry is a TikTok video ad for make.fun. This program does exactly one
// thing: it copies VIDEO.json, which names the video's full address on TikTok,
// into the output directory the harness provides. It needs no network and
// uses only the Node.js standard library.

import { copyFileSync, mkdirSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const outDir = process.env.MAKEFUN_OUTPUT_DIR ?? "out";
const outFile = join(outDir, "VIDEO.json");

mkdirSync(outDir, { recursive: true });
copyFileSync(join(here, "VIDEO.json"), outFile);

// Read the copy back and check it really names a video: a silent bad copy
// would enter a placeholder as the entry, so fail loudly instead.
const video = JSON.parse(readFileSync(outFile, "utf8"));
if (typeof video.url !== "string" || video.url.length === 0) {
  throw new Error("VIDEO.json has no video url");
}

console.log("VIDEO.json copied to " + outDir + " for video " + video.url);
