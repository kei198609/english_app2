# サービス概要

下記リンクからアクセスできます。

# 使用技術

| フロントエンド
----|
| Nuxt.js(SPA)  |
| Vuetify |
| axios(バックエンドとの非同期通信) |
| eslint/prettier(静的解析、フォーマッター) |

<br />

| バックエンド |
----|
| Ruby 3.1.3 |
| Rails 7.0.4 |
| RuboCop(静的解析、フォーマッター) |
| RSpec(自動テスト) |
| nginx(Webサーバー) |
| puma(APサーバー) |
| MySQL 8.0.31(データベース) |

<br />

| インフラ |
----|
| Docker/docker-compose |
| AWS（ECR,ECS,Fargate,VPC,S3,Route53,ALB,RDS,ACM,SSM,CloudWatch,CodeBuild） |
| Terraform(インフラのコード管理) |
| Github Actions |

<br />

# 機能一覧

# 工夫したところ

## バックエンド

## フロントエンド
 - **完全SPA化**で作成しました。
 - UIフレームワークにVuetifyを使用し、**整ったUI**を意識しました。
 - VuetifyのGridシステムを利用し、**レスポンシブデザイン**を実装しました。
 - ESLint/Prettierを利用して、読みやすいコードを意識しました。
## インフラ