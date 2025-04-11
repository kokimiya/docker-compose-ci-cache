# github-rule
私がGitHub Actionsを理解するためだけのリポジトリ

## 目的
GitHub Actionsから、docker composeコマンドを使ってビルドしているCIに対して、  
キャッシュを効かしてDockerビルドできる方法を調査する。

## 調査結果
`docker compose -f docker-compose.ci.yml build` でビルドをせずに、  
`docker/setup-buildx-action`を使ってビルドすれば、Dockerレイヤーのキャッシュを利用できる。

## 詳細
### キャッシュ保管場所
- github cache (type=gha)
  - [GitHubは、7日間以上アクセスされていないキャッシュエントリを削除します。](https://docs.github.com/ja/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows#usage-limits-and-eviction-policy)
  - [リポジトリ内のすべてのキャッシュの合計サイズは制限されています (最大 10 GB)](https://docs.github.com/ja/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows#usage-limits-and-eviction-policy)







