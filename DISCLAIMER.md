⚠️ Project Architecture Note

This project demonstrates MNIST digit classification using:
- Flutter for the frontend
- Embedded tflite for android
- A local Flask server (emulating Firebase Cloud Functions) for web

Why not Firebase Cloud Functions?
- Firebase's free "Spark" plan doesn't support Python functions
- Cloud Functions for Python require the "Blaze" pay-as-you-go plan

For a production deployment, you would:
1. Deploy the Python code to Firebase Cloud Functions (Blaze plan)
2. Or use alternatives like Google Cloud Run/AWS Lambda