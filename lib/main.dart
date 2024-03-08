import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 144, 117, 117)),
      ),
      home: const MyHomePage(title: 'Kilometers -> Meters'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController inputKM = TextEditingController();
  final TextEditingController inputM = TextEditingController();
  String result1 = "";
  String result2 = "";

  void convertKmToM(){
    double kmeter = double.tryParse(inputKM.text) ?? 0;
    double meter  = kmeter * 1000;
    setState(() {
      result1 = '$kmeter kilometers = $meter meters';
    });
  }

void convertMtoKM(){
    double meter = double.tryParse(inputM.text) ?? 0;
    double kmeter  = meter / 1000;
    setState(() {
      result2= '$meter meters = $kmeter kilometers';
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: const Color.fromARGB(255, 191, 176, 176),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: inputKM,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Enter KM"),
              ),
              TextFormField(
                controller: inputM,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Enter M"),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      convertKmToM();
                    },
                    child: Text('Convert KM to M'),
                  ),
                  SizedBox(width: 200),
                  ElevatedButton(
                    onPressed: () {
                      convertMtoKM();
                    },
                    child: Text('Convert M to KM'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '$result1\n$result2',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
