import os
import sys
from flask import Flask, request, jsonify
import numpy as np
from tensorflow import keras

# Add virtual environment site-packages to path
venv_path = os.path.join(os.path.dirname(__file__), 'venv', 'Lib', 'site-packages')
if os.path.exists(venv_path):
    sys.path.append(venv_path)

app = Flask(__name__)

# Load the model once at startup
model = keras.models.load_model('D:\\Desktop\\cats\\mnister\\assets\\models\\mnist_model.h5')

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
        grid = data.get('grid', [])
        input_data = np.array(grid).reshape(1, 28, 28, 1)
        prediction = model.predict(input_data).argmax()
        return jsonify({
            "prediction": int(prediction),
            "status": "success"
        }), 200, headers
    
    except Exception as e:
        return jsonify({"error": str(e)}), 400, headers

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
