# python3_docker_environment

Python 3.8.5 を環境へインストールせずに実行するためだけのプロジェクト。  
環境にいろいろインストールしたくないがちょろっと試したい、という用途の想定。

ビルド：

```sh
$ docker-compose up -d --build
Building python3
:
:
Successfully tagged python3_docker_environment_python3:latest
Creating python3 ... done
```


例：docker-compose.yml の services で定義した python3 を使い、コンテナ内の Python のバージョンを確認する

```sh
$ docker-compose exec python3 python --version
Python 3.8.5
```


例：services で定義した python3 を使い、コンテナ内の Python のバージョンを確認する

```sh
$ docker-compose exec python3 python ./helloworld.py
Hello, World!
```
