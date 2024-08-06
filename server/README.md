# server

## localで動かす

### 準備

FirebaseのAuthenticationを用いています

.env

```env
PATH_TO_FIREBASE_JSON = "example"
```

Firebase Authenticationに従ってsdkのjsonを配置して，パスを設定してください

### ライブラリのインストール

```zsh
pip install -r requirements.txt
```

### 参考

[サーバーに Firebase Admin SDK を追加する](https://firebase.google.com/docs/admin/setup?hl=ja)

[Admin Auth API の概要](https://firebase.google.com/docs/auth/admin?hl=ja)

[Python の Flask Web API に JWT認証（Flask-JWT-Extended）を組み込んだ](https://qiita.com/kerobot/items/c5607658171c2aec4f46)
