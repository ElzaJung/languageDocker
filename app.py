from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

# LibreTranslate API URL (inside the same container)
LIBRETRANSLATE_URL = "http://localhost:5000/translate"

@app.route('/')
def index():
    return "LibreTranslate API Running"

@app.route('/translate', methods=['POST'])
def translate():
    data = request.get_json()
    text = data.get("text", "").strip()
    source_lang = data.get("source", "en")
    target_lang = data.get("target", "es")

    if not text:
        return jsonify({"error": "No text provided"}), 400

    # Call LibreTranslate API
    response = requests.post(LIBRETRANSLATE_URL, json={
        "q": text,
        "source": source_lang,
        "target": target_lang,
        "format": "text"
    })

    if response.status_code != 200:
        return jsonify({"error": "Translation failed"}), 500

    translated_text = response.json().get("translatedText", "")

    return jsonify({"translated_text": translated_text})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
