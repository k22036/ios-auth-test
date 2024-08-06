import os
from dotenv import load_dotenv


class Settings:
    def __init__(self, envpath):
        # .env ファイルを明示的に指定して環境変数として読み込む
        self.__dotenv_path = envpath
        load_dotenv(self.__dotenv_path)
        # 環境変数から設定値を取得
        self.__path_to_firebase_json = os.environ.get("PATH_TO_FIREBASE_JSON")

    # firebase の json
    @property
    def path_to_firebase_json(self):
        return self.__path_to_firebase_json
