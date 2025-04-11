FROM node:18

WORKDIR /app

COPY package.json package-lock.json .
RUN npm install

# 重めの処理を追加
RUN curl -s https://raw.githubusercontent.com/dwyl/english-words/master/words.txt -o /tmp/words.txt && \
    cat /tmp/words.txt | sort | uniq | grep 'z' > /tmp/filtered.txt

COPY . .

CMD ["node", "app.js"]
