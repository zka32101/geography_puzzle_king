from PIL import Image
import os

SRC_DIR = os.path.join(os.path.dirname(__file__), "raw", "screenshots")
OUT_DIR = os.path.join(os.path.dirname(__file__), "app_store_6.9in")
os.makedirs(OUT_DIR, exist_ok=True)

# App Store Connect: iPhone 6.9" Display (iPhone 16 Pro Max等) required size
TARGET_SIZE = (1320, 2868)

# ファイル名 -> 分かりやすい提出用名称
FILES = {
    "IMG_0008.PNG": "01_prefecture_select",
    "IMG_0009.PNG": "02_prefecture_detail_aomori",
    "IMG_0002.PNG": "03_boss_intro_hokkaido",
    "IMG_0005.PNG": "04_gameplay_wave",
    "IMG_0006.PNG": "05_result_clear",
    "IMG_0007.PNG": "06_result_clear_scrolled",
}


def resize_cover(im, target_w, target_h):
    """アスペクト比を保ったまま target サイズを埋めるように拡大し、
    はみ出た部分を中央基準でクロップする（レターボックスなし）。"""
    src_w, src_h = im.size
    src_ratio = src_w / src_h
    target_ratio = target_w / target_h

    if src_ratio > target_ratio:
        # 元画像の方が横長 → 高さを合わせて横をクロップ
        new_h = target_h
        new_w = round(src_w * (target_h / src_h))
    else:
        # 元画像の方が縦長 → 幅を合わせて縦をクロップ
        new_w = target_w
        new_h = round(src_h * (target_w / src_w))

    resized = im.resize((new_w, new_h), Image.LANCZOS)
    left = (new_w - target_w) // 2
    top = (new_h - target_h) // 2
    return resized.crop((left, top, left + target_w, top + target_h))


for filename, out_name in FILES.items():
    path = os.path.join(SRC_DIR, filename)
    im = Image.open(path).convert("RGB")
    out = resize_cover(im, *TARGET_SIZE)
    out_path = os.path.join(OUT_DIR, f"{out_name}.png")
    out.save(out_path)
    print(f"{filename} ({im.size}) -> {out_name}.png ({out.size})")

print("done")
