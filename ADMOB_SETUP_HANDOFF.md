# AdMob 本番 ID 設定 - ローカル引き継ぎドキュメント

**作成日**: 2026-09-15  
**ステータス**: Android 本番 ID 設定完了、ビルドタグ作成待ち

---

## 📋 完了した作業

### PR #9: Android 本番 ID 初回設定（マージ済み）
- **ファイル**: `lib/services/ad_service.dart`
  - Android Banner Unit ID: `ca-app-pub-5058227312086483/9803714654`
  - Android Interstitial Unit ID: `ca-app-pub-5058227312086483/8490632980`
  - iOS: テスト ID のまま（TODO コメント付き）

- **ファイル**: `android/app/src/main/AndroidManifest.xml`
  - Android App ID: `ca-app-pub-5058227312086483~5392989482`

- **ファイル**: `ios/Runner/Info.plist`
  - コメント更新（iOS 本番 ID 設定待ち）

### PR #10: Android Banner Unit ID 修正（マージ済み）
- **ファイル**: `lib/services/ad_service.dart`
  - Android Banner Unit ID を修正: `/9803714654` → `/7793638149`
  - CI: すべてのチェック通過（scan, analyze-and-test, build-ios）

---

## 🔧 次のステップ

### ステップ 1: ビルドタグをプッシュ（ローカルで実行）

```bash
# リモート リポジトリを最新に更新
cd ~/path/to/geography_puzzle_king
git fetch origin main
git checkout main
git pull origin main

# 本番 ID が設定されていることを確認
cat apps/geography_puzzle_king/lib/services/ad_service.dart | grep -A 5 "static String get banner"
```

確認内容:
- ✅ Banner Unit ID: `ca-app-pub-5058227312086483/7793638149`
- ✅ Interstitial Unit ID: `ca-app-pub-5058227312086483/8490632980`

### ステップ 2: ビルドタグを作成してプッシュ

```bash
# タグを作成（ローカル）
git tag geography-puzzle-king-v1.0.0

# タグをプッシュ
git push origin geography-puzzle-king-v1.0.0
```

### ステップ 3: 自動ビルド確認

GitHub Actions の [`android-deploy.yml`](https://github.com/zka32101/geography_puzzle_king/actions/workflows/android-deploy.yml) ワークフローが自動で実行されます。

- ビルド時間: 約 5-10 分
- 出力: `app-release.apk`
- アーティファクト保持期間: 30 日間

---

## 📱 テスト手順（ビルド後）

### 1. Android デバイスへのインストール

```bash
# APK をダウンロード
# GitHub Actions Artifacts から app-release.apk をダウンロード

# デバイスにインストール
adb install app-release.apk

# または USB 経由で直接インストール
```

### 2. 広告の動作確認

- **バナー広告**: ゲーム画面の下部に表示されることを確認
- **インタースティシャル広告**: ゲーム終了時に全画面広告が表示されることを確認
- **AdMob エラーなし**: ログキャットでエラーが出ないことを確認

```bash
adb logcat | grep -i admob
```

---

## 🍎 iOS 本番 ID 設定（後日）

iOS は保留中です。準備ができたら以下を実施してください：

1. AdMob コンソールで iOS アプリを登録
2. iOS App ID と各広告ユニット ID を取得
3. 以下のファイルを更新：
   - `lib/services/ad_service.dart` (iOS Banner/Interstitial Unit ID)
   - `ios/Runner/Info.plist` (iOS App ID)
4. PR を作成して main へマージ
5. 新しい タグ（例: `geography-puzzle-king-v1.1.0`）を作成

---

## 📊 AdMob 本番 ID 一覧

| 項目 | 値 | ステータス |
|------|-----|----------|
| **Android App ID** | `ca-app-pub-5058227312086483~5392989482` | ✅ 設定済み |
| **Android Banner Unit ID** | `ca-app-pub-5058227312086483/7793638149` | ✅ 設定済み |
| **Android Interstitial Unit ID** | `ca-app-pub-5058227312086483/8490632980` | ✅ 設定済み |
| **iOS App ID** | - | 🔄 待機中 |
| **iOS Banner Unit ID** | - | 🔄 待機中 |
| **iOS Interstitial Unit ID** | - | 🔄 待機中 |

---

## 🔗 参考リンク

- [AdMob Console](https://admob.google.com)
- [Google Play Console](https://play.google.com/console)
- [GitHub Actions Workflow](https://github.com/zka32101/geography_puzzle_king/actions/workflows/android-deploy.yml)
- [Repository](https://github.com/zka32101/geography_puzzle_king)

---

## 📝 ローカル作業ログ

**2026-09-15**
- ✅ PR #9 作成・マージ: Android 本番 ID 設定
- ✅ PR #10 作成・マージ: Banner Unit ID 修正
- ✅ ビルドタグ `geography-puzzle-king-v1.0.0` をローカルで作成
- ⏳ ビルドタグ プッシュ待機（リモートマシンのプロキシエラーのため）

**次のアクション**: ローカルマシンから `git push origin geography-puzzle-king-v1.0.0` を実行

---

**質問やトラブルがあれば、GitHub Issues で報告してください。**
