/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const functions = require('firebase-functions');
const express = require('express');
const cors = require('cors');
const tf = require('@tensorflow/tfjs-node');
const path = require('path');
const fs = require('fs');

const app = express();
app.use(cors({ origin: true }));

let model;

const loadModel = async () => {
  if (!model) {
    const modelPath = `file://${path.join(__dirname, 'tfjs_model', 'model.json')}`;
    model = await tf.loadLayersModel(modelPath);
    console.log("Model loaded");
  }
};

app.post('/predict', async (req, res) => {
  try {
    await loadModel();

    const inputArray = req.body.input; 
    if (!inputArray || inputArray.length !== 784) {
      return res.status(400).send({ error: 'Input must be a 784-length array' });
    }

    const inputTensor = tf.tensor2d([inputArray], [1, 784]);

    const prediction = model.predict(inputTensor);
    const result = prediction.argMax(1).dataSync()[0];

    res.send({ prediction: result });
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: 'Inference failed' });
  }
});

// Export the function
exports.api = functions.https.onRequest(app);
