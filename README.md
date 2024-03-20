 
======================= 
nk225notify 
======================= 
* https://db.225225.jp/bp1.php より日経平均株価をスクレイピングし、その時点の情報をline通知する
 

prepare
===========
line通知用にアクセストークンを取得してください。説明できないので、調べてください。
コンテナ内では、/usr/loca/bin/nk225notify/settings/config.py にその情報を記載してください。


start
===========
1. プロジェクトのクローン::
 
    git clone https://github.com/epgradiko/nk225notify

2. podmanビルド(適宜修正)

    cd nk225notify
    ./build.sh

3. 実行(適宜修正)

    ./run

※初期状態として、9:03,14:31,15:03に通知するようにしています。コンテナ内では/etc/crontab/nk225 に設定しています。
