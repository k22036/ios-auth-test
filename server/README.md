# server

## localで動かす

### 準備

FirebaseのAuthenticationを用いています

main.py

```python
path_to_json = "path/to/serviceAccountKey.json"
```

Firebase Authenticationに従ってsdkのjsonを配置して，パスを設定してください

### ライブラリのインストール

```zsh
pip install -r requirements.txt
```

### 参考

[サーバーに Firebase Admin SDK を追加する](https://firebase.google.com/docs/admin/setup?hl=ja)

[Admin Auth API の概要](https://firebase.google.com/docs/auth/admin?hl=ja)
