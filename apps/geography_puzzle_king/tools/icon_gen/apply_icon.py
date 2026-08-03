from PIL import Image
import os

BASE = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
SRC = os.path.join(BASE, "tools", "icon_gen", "icon_v5_candidate_3.png")

master = Image.open(SRC).convert("RGB")

android_sizes = {
    "mipmap-mdpi": 48,
    "mipmap-hdpi": 72,
    "mipmap-xhdpi": 96,
    "mipmap-xxhdpi": 144,
    "mipmap-xxxhdpi": 192,
}
for folder, size in android_sizes.items():
    out_path = os.path.join(BASE, "android", "app", "src", "main", "res", folder, "ic_launcher.png")
    master.resize((size, size), Image.LANCZOS).save(out_path)
    print(f"Android: {out_path} ({size}x{size})")

ios_sizes = {
    "Icon-App-20x20@1x.png": 20,
    "Icon-App-20x20@2x.png": 40,
    "Icon-App-20x20@3x.png": 60,
    "Icon-App-29x29@1x.png": 29,
    "Icon-App-29x29@2x.png": 58,
    "Icon-App-29x29@3x.png": 87,
    "Icon-App-40x40@1x.png": 40,
    "Icon-App-40x40@2x.png": 80,
    "Icon-App-40x40@3x.png": 120,
    "Icon-App-50x50@1x.png": 50,
    "Icon-App-50x50@2x.png": 100,
    "Icon-App-57x57@1x.png": 57,
    "Icon-App-57x57@2x.png": 114,
    "Icon-App-60x60@2x.png": 120,
    "Icon-App-60x60@3x.png": 180,
    "Icon-App-72x72@1x.png": 72,
    "Icon-App-72x72@2x.png": 144,
    "Icon-App-76x76@1x.png": 76,
    "Icon-App-76x76@2x.png": 152,
    "Icon-App-83.5x83.5@2x.png": 167,
    "Icon-App-1024x1024@1x.png": 1024,
}
ios_dir = os.path.join(BASE, "ios", "Runner", "Assets.xcassets", "AppIcon.appiconset")
for filename, size in ios_sizes.items():
    out_path = os.path.join(ios_dir, filename)
    master.resize((size, size), Image.LANCZOS).save(out_path)
    print(f"iOS: {out_path} ({size}x{size})")

print("done")
