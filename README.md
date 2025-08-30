## MNIST Digit Recognizer (Flutter App)
A simple proof-of-concept Flutter application that recognizes handwritten digits. Users can draw a number on a canvas, and a pre-trained MNIST TFLite model running on the device will predict the digit.

## What It Does
This app provides a 28x28 canvas where a user can draw a single digit (0-9). Once the drawing is complete, the app processes the image and feeds it into a TensorFlow Lite model to predict the number drawn. The predicted result is then displayed on the screen.

## How It Works
Drawing: The user draws a digit on a canvas widget in the Flutter UI.

Image Processing: The hand-drawn image from the canvas is converted into a format that the model can understand (a 28x28 grayscale pixel array).

On-Device Inference: The processed image data is passed to an MNIST-trained TensorFlow Lite (.tflite) model integrated directly into the app.

Prediction: The model runs inference locally on the device to predict which digit was drawn.

Display: The app displays the model's prediction back to the user.

## Project Status
⚠️ Proof of Concept: This is a sample project built to demonstrate the integration of a TFLite model in a Flutter app.
