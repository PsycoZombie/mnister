import os
import sys
from flask import Flask, request, jsonify
import numpy as np
from tensorflow import keras

# Optional: Load venv site-packages if needed
venv_path = os.path.join(os.path.dirname(__file__), 'venv', 'Lib', 'site-packages')
if os.path.exists(venv_path):
    sys.path.append(venv_path)

app = Flask(__name__)

# Load your trained CNN model (.h5 format)
model_path = 'D:\\Desktop\\cats\\mnister\\assets\\models\\mnist_cnn_model.h5'
model = keras.models.load_model(model_path)

@app.route('/predict', methods=['POST', 'OPTIONS'])
def mnist_predict():
    headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST',
        'Access-Control-Allow-Headers': 'Content-Type'
    }

    if request.method == 'OPTIONS':
        return ('', 204, headers)

    try:
        data = request.get_json()
        grid = data.get('grid')

        if grid is None or len(grid) != 28 or len(grid[0]) != 28:
            return jsonify({"error": "Invalid input shape"}), 400, headers

        # Normalize input (ensure values are 0–1)
        input_array = np.array(grid).astype(np.float32).reshape(1, 28, 28, 1)
        prediction_logits = model.predict(input_array)
        predicted_class = int(np.argmax(prediction_logits))

        return jsonify({
            "prediction": predicted_class,
            "status": "success"
        }), 200, headers

    except Exception as e:
        return jsonify({"error": str(e)}), 400, headers

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
