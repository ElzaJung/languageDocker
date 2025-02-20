from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route('/')
def index():
    return "LibreTranslate API Running"

@app.route('/translate', methods=['POST'])
def translate():
    data = request.get_json()
    # Dummy translation: reversing the input text.
    original_text = data.get("text", "")
    translated_text = original_text[::-1]
    return jsonify({"translated_text": translated_text})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
