# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

このプロジェクトはSwitchBot APIの非公式OpenAPIスキーマを提供するものです。TypeSpecを使用してAPI仕様を定義し、OpenAPIスキーマとドキュメントを生成します。

## よく使用されるコマンド

- ビルド:
  - `pnpm build`: 全体をビルド（TypeSpec + ドキュメント）
- 静的解析(自動修正)
  - `pnpm fix`: 全ての自動修正を実行
- 静的解析(チェック)
  - `pnpm lint`: 全ての静的解析を実行(cspell, prettier, redocly, eslint)
  - `pnpm typecheck`: TypeSpecの型チェック（`pnpm build:tsp --noEmit`）

## アーキテクチャ

### ファイル構成

- `src/main.tsp`: メインのTypeSpecファイル、全てのルートとサービス定義を含む
- `src/lib/`: 共通ライブラリ
  - `shared-errors.tsp`: 共通エラー定義
  - `shared-response.tsp`: 共通レスポンス型定義
- `src/features/`: 機能別のAPI定義
  - `device/`: デバイス関連API（list, status, control）
  - `scene/`: シーン関連API
  - `webhook/`: Webhook関連API

### TypeSpec構造

- 各機能は個別の名前空間で定義（DevicesRoute, SceneRoute, WebhookRoute）
- SwitchBot API v1.1に対応
- 認証はAPIキー認証（Authorization, sign, nonceヘッダー）を使用
- 全てのAPIレスポンスはSharedResponseパターンを使用

### 出力

- `dist/@typespec/openapi3/openapi.yaml`: 生成されるOpenAPI仕様書
- `dist/doc/index.html`: Redoclyで生成されるドキュメント

## ワーキングアグリーメント

- 公用語は日本語であり、常に日本語でコミュニケーションを取ること
- 変更の確認は必ず以下のステップで行うこと
  - `pnpm build` でスキーマ及びドキュメントをビルドできること
  - `pnpm fix` で修正不可能な問題が発生しない
  - `pnpm lint` で他の lint エラーが発生しない

## 開発時の注意点

### TypeSpec編集

- 新しいエンドポイントを追加する場合は、適切な機能フォルダにファイルを作成し、main.tspでimport
- 共通の型定義はlibフォルダに配置
- API仕様は公式ドキュメントに基づいて作成するが、一部LLMで生成された部分があるため品質保証は不完全
