# Petit Works Apps Monorepo

Petit Works Apps の各アプリをまとめて管理するモノレポです。

## 構成

```
apps/
  geography_puzzle_king/   # ゲームで学ぶ都道府県（都道府県タワーディフェンス）
  (今後、他アプリを追加していく想定)
```

## CI

各アプリの GitHub Actions ワークフローは `.github/workflows/` に配置し、
`paths:` フィルタで該当アプリのディレクトリ変更時のみ起動するようにしています
（例: `<app>-ci.yml` が `apps/<app>/**` の変更時のみ起動）。

macOS ランナー（iOS ビルド）は 10 倍課金のため、`workflow_dispatch`（手動実行）
または PR 時のみに限定し、通常の push では絶対に自動起動しない方針としています。
