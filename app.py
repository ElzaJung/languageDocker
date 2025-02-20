import os

# Set a writable directory for argostranslate
os.environ["ARGOS_TRANSLATE_DATA_DIR"] = "/tmp/argos_data"

from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

# LibreTranslate API URL
LIBRETRANSLATE_URL = "http://localhost:5001/translate"

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
    port = int(os.environ.get("PORT", 5000))  # Render requires Flask to run on 5000
    app.run(host='0.0.0.0', port=port)
