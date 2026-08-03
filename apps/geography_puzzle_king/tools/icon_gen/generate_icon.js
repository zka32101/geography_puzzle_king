// 地理パズル王（日本領土ディフェンス）のアプリアイコンをLeonardo AIで生成する。
// 実行: LEONARDO_API_KEY を環境変数に設定した状態で `node generate_icon.js`
const fs = require('fs');
const path = require('path');

const API_KEY = process.env.LEONARDO_API_KEY;
if (!API_KEY) {
  console.error('LEONARDO_API_KEY が設定されていません');
  process.exit(1);
}

const OUTPUT_DIR = __dirname;
const MODEL_ID = 'de7d3faf-762f-48e0-b3b7-9d0ac3a3fcf3'; // Leonardo Phoenix 1.0

const PROMPT = [
  'flat vector game icon graphic filling the entire square canvas edge to edge,',
  'ONE bold golden stone watchtower / defense tower silhouette, centered, standing tall,',
  'tower is on top of a small rounded golden hill or island mound,',
  'two or three thin concentric golden ring outlines radiating out from the tower like a radar / attack range indicator,',
  'a small blue shield emblem with a white star badge in the bottom-right corner,',
  'solid deep green background covering 100% of the square all the way to every edge, no framing,',
  'clean bold flat shapes, minimal detail, strong readable silhouette, tower-defense strategy game logo',
].join(' ');

const NEGATIVE_PROMPT = [
  'text, watermark, signature, blurry, photorealistic, 3d render,',
  'complicated details, multiple towers, castle with many towers, cluttered, low quality,',
  'rounded corners, rounded square, icon frame, square border frame, rectangular outline frame,',
  'picture frame, bezel, app icon container, white margin, padding, background outside the shape,',
  'drop shadow, glossy bevel, letter S, letter C, letter shape, typography, crescent moon, hook shape,',
  'crossed swords, X shape, wings, feathers, map, country outline, archipelago, islands chain',
].join(' ');

async function main() {
  console.log('生成リクエスト送信中...');
  const genRes = await fetch('https://cloud.leonardo.ai/api/rest/v1/generations', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${API_KEY}`,
    },
    body: JSON.stringify({
      modelId: MODEL_ID,
      prompt: PROMPT,
      negative_prompt: NEGATIVE_PROMPT,
      width: 1024,
      height: 1024,
      num_images: 4,
      alchemy: false,
      photoReal: false,
    }),
  });

  if (!genRes.ok) {
    const errText = await genRes.text();
    throw new Error(`生成リクエスト失敗: ${genRes.status} ${errText}`);
  }

  const genData = await genRes.json();
  const generationId = genData.sdGenerationJob.generationId;
  console.log(`generationId: ${generationId}`);

  console.log('生成完了を待機中...');
  let images = null;
  for (let i = 0; i < 30; i++) {
    await new Promise((r) => setTimeout(r, 3000));
    const pollRes = await fetch(
      `https://cloud.leonardo.ai/api/rest/v1/generations/${generationId}`,
      { headers: { Authorization: `Bearer ${API_KEY}` } }
    );
    const pollData = await pollRes.json();
    const status = pollData.generations_by_pk?.status;
    process.stdout.write(`  status: ${status}\r\n`);
    if (status === 'COMPLETE') {
      images = pollData.generations_by_pk.generated_images;
      break;
    }
    if (status === 'FAILED') {
      throw new Error('生成に失敗しました');
    }
  }

  if (!images) {
    throw new Error('タイムアウト: 90秒以内に生成が完了しませんでした');
  }

  console.log(`${images.length}枚の候補を保存します...`);
  for (let i = 0; i < images.length; i++) {
    const imgRes = await fetch(images[i].url);
    const buffer = Buffer.from(await imgRes.arrayBuffer());
    const outPath = path.join(OUTPUT_DIR, `icon_v5_candidate_${i + 1}.png`);
    fs.writeFileSync(outPath, buffer);
    console.log(`保存: ${outPath}`);
  }

  console.log('完了');
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
