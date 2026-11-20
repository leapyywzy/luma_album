#!/usr/bin/env bash
set -euo pipefail

# 通过当前 Flutter SDK 生成官方原生工程模板，只复制平台目录，
# 避免覆盖仓库中已经维护的 pubspec.yaml、lib/ 和 test/。
if [[ -d android && -d ios && -d windows ]]; then
  echo "Flutter platform folders already exist; skipping bootstrap."
  exit 0
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

flutter create \
  --platforms=android,ios,windows \
  --org com.luma.album \
  --project-name luma_album \
  "$TMP_DIR/luma_album"

cd "$ROOT_DIR"
for platform in android ios windows; do
  if [[ ! -d "$platform" ]]; then
    cp -R "$TMP_DIR/luma_album/$platform" "$ROOT_DIR/$platform"
  fi
done
if [[ ! -f .metadata ]]; then
  cp "$TMP_DIR/luma_album/.metadata" "$ROOT_DIR/.metadata"
fi

# iOS 相册访问用途说明。
python3 - <<'PY'
from pathlib import Path

plist = Path("ios/Runner/Info.plist")
if plist.exists():
    content = plist.read_text()
    additions = (
        "\n    <key>NSPhotoLibraryUsageDescription</key>\n"
        "    <string>Luma Album 需要访问照片图库，以便浏览和整理你的照片。</string>\n"
        "    <key>NSPhotoLibraryAddUsageDescription</key>\n"
        "    <string>Luma Album 需要权限，以便将编辑后的照片保存到图库。</string>\n"
    )
    if "NSPhotoLibraryUsageDescription" not in content:
        content = content.replace("</dict>", additions + "</dict>")
        plist.write_text(content)
PY

echo "Android, iOS and Windows platform scaffolding generated."
