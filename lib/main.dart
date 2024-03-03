import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/jokes_model.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String joke = "";

  Future<void> getData() async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://api.chucknorris.io/jokes/random");
    JokesModel model = JokesModel.fromJson(response.data);
    setState(() {
      joke = model.value ?? '';
    });
  }

  Future<void> translateFromEnToRu() async {
    final translator = GoogleTranslator();
    Translation translatedText =
        await translator.translate(joke, from: 'en', to: 'ru');
    setState(() {
      joke = translatedText.toString();
    });
  }

  Future<void> translateFromRuToEn() async {
    final translator = GoogleTranslator();
    Translation translatedText =
        await translator.translate(joke, from: 'ru', to: 'en');
    setState(() {
      joke = translatedText.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Jokes App",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                joke,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: getData,
                child: const Text(
                  "Get Joke",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: translateFromEnToRu,
                    child: const Text("Translate to RU"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: translateFromRuToEn,
                    child: const Text("Translate to EN"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
