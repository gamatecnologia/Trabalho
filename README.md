# trabalho

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDcqEW6NrPtZIAGDzqDoBfVIuS1QACtBaE",
  authDomain: "trabalho-mobile-8a764.firebaseapp.com",
  databaseURL: "https://trabalho-mobile-8a764-default-rtdb.firebaseio.com",
  projectId: "trabalho-mobile-8a764",
  storageBucket: "trabalho-mobile-8a764.appspot.com",
  messagingSenderId: "1003543441926",
  appId: "1:1003543441926:web:fd61f8ba2cf76d87630987",
  measurementId: "G-53T822XHDF"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
