import firebase_admin
from firebase_admin import credentials, auth
from flask import Flask, request, jsonify

path_to_json = "path/to/serviceAccountKey.json"
cred = credentials.Certificate(path_to_json)
firebase_admin.initialize_app(cred)
app = Flask(__name__)


@app.route('/signup', methods=['POST'])
def signup():
    email = request.json['email']
    if not email:
        return jsonify({'error': 'Missing email'}), 400
    password = request.json['password']
    if not password:
        return jsonify({'error': 'Missing password'}), 400

    try:
        user = auth.create_user(email=email, password=password)
    except Exception as e:
        return jsonify({'error': str(e)}), 400

    return jsonify({'uid': user.uid}), 200


if __name__ == '__main__':
    app.run()
