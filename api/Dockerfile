# ベースイメージ
FROM ruby:3.1.3-alpine

# dockerfile内で使用する変数を定義
# appという値が入る
# ARG WORKDIR
# dockerfile内でしか使用しないのでARGに移動
# ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
ARG RUNTIME_PACKAGES="nodejs tzdata mysql-dev mysql-client git libc6-compat"
ARG DEV_PACKAGES="build-base curl-dev"


# 環境変数を定義する命令
# dockerfileとコンテナから参照可能
ENV HOME=/app \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# ベースイメージに対してコマンドを実行する
# dockerfile内で変数を展開するには${HOME} or $HOMEと書く
# この場合${HOME}には/appという文字列が出力される
# RUN echo ${HOME}

# dockerfile内で指定した命令（RUN,COPY,ADD,ENTORYPOINT,CMD）を実行する
# 作業ディレクトリを定義
# コンテナ/app/Railsアプリ
WORKDIR ${HOME}

# COPY命令は、ホスト側（自分PC）のファイルをコンテが側にコピーする場合に使う
# 書き方はCOPY コピー元（ホスト）コピー先（コンテナ）
# コピー元はdockerfileがあるディレクトリ以下を指定すること
# コピー先（コンテナ）は絶対パスか相対パス（./は今いるディレクトリ)）
# 今いるディレクトリはWORKDIR ${HOME}で指定したディレクトリのことでappなので、
# Gemfile関連をappディレクトリ直下にコピーするということ
# COPY Gemfile* ./

# GemfileとGemfile.lockを先にコピーしてbundle installを行う
COPY Gemfile Gemfile.lock ./

# apk updateパッケージの最新リストを取得
# apk upgradeインストールパッケージを最新のものに
# apk addパッケージのインストールを実行
# --no-cacheパッケージをキャッシュしない（dockerイメージを軽量化）
# --virtual 名前（任意）はパッケージを一まとめにする(↑のENVで指定したDEV_PACKAGES)
# -j4はgemのインストール高速化のオプション
# apk delパッケージを削除するコマンド、一まとめにしたbuild-dependenciesを削除
RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies && \
    ln -s /lib64/ld-linux-x86-64.so.2 /lib/

# .はdockerfileがあるディレクトリ全てのファイルをコピーして
# コンテナのカレントディレクトリ（./）へコピーするという命令
# COPY . ./

# その他のアプリケーションファイルをコピーする
COPY . ${HOME}


# 生成されたコンテナ内で実行したいコマンドを指定
# -bはバインド。プロセスを指定したip(0.0.0.0)アドレスに紐付け（バインド）する
CMD ["rails", "server", "-b", "0.0.0.0"]