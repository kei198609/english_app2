# # ベースイメージ
# FROM node:18.12.1-alpine

# ARG WORKDIR
# # ARG CONTAINER_PORT

# # LANG:コンテナ内で使用する言語や単位
# # C:コンピュータ用の英語
# # UTF-8:文字コード
# # LANG=C.UTF-8はコンピュータ用の英語を文字コードUTF-8で利用するということ
# # HOST=0.0.0.0を指定しないと、ブラウザからhttp://localhost へアクセスすることができない。
# ENV HOME=/${WORKDIR} \
#     LANG=C.UTF-8 \
#     TZ=Asia/Tokyo \
#     HOST=0.0.0.0

# # ENV check（このRUN命令は確認のためなので無くても良い）
# # RUN echo ${HOME}
# # RUN echo ${CONTAINER_PORT}

# WORKDIR ${HOME}

# # 公開用のポート番号を指定
# # 3000が入る
# # http;//localhost(0.0.0.0):3000のURLで外部ブラウザから
# # コンテナのNuxtを参照することができる。
# # ただしnuxtのデフォルトの公開番号は3000なので、消してよい↓
# # EXPOSE ${CONTAINER_PORT}