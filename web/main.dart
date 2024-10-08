import 'dart:js_interop';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:web/web.dart' as web;

void main() {
  final now = DateTime.now();
  final element3 = web.document.querySelector("#entrada") as web
      .HTMLInputElement;
  final element2 = web.document.querySelector("#boton") as web
      .HTMLButtonElement;
  final element = web.document.querySelector('#output') as web.HTMLDivElement;
  final apiKey = "apikey";
  final model = GenerativeModel(model: "gemini-1.0-pro", apiKey: apiKey);
  final salida = web.document.querySelector("#respuesta") as web
      .HTMLParagraphElement;
  var response;
  element2.onClick.listen((event) async {
    var texto = element3.value;

    // Display "Cargando..."
    salida.text = "Generando...";

    try {
      final content = [Content.text(texto)];
      response = await model.generateContent(content);
      salida.text = response.text!;
      web.console.log(response.text as JSAny?);
    } catch (e) {
      salida.text =
      "Error: $e"; // Display error message if something goes wrong
      web.console.log(response as JSAny?);
    }
  });
  element.text = 'The time is ${now.hour}:${now.minute} '
      'and your Dart web app is running!';
}