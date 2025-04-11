FROM node:18

WORKDIR /app

# 依存関係を先に分けてコピー → キャッシュされやすい
COPY package.json .

# NPMインストール（レイヤーキャッシュ対象）
RUN npm install

# 残りのアプリをコピー（変更が頻繁に起きやすい）
COPY . .

CMD ["node", "app.js"]
