import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter+App',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter+ App'),
        ),
        body: Center(
          child: CounterWidget(),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  double fontSize = 48;

  void incrementFontSize() {
    setState(() {
      fontSize += 12;
    });
  }

  void decrementFontSize() {
    setState(() {
      fontSize -= 12;
      if (fontSize <= 0) {
        fontSize = 48;
      }
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    if (counter > 0) {
      textColor = Colors.green;
    } else if (counter < 0) {
      textColor = Colors.red;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Counter',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          '$counter',
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: incrementCounter,
              child: const Icon(Icons.add),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.white),
                )),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: decrementCounter,
              child: const Icon(Icons.remove),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: resetCounter,
              child: const Icon(Icons.refresh),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.text_increase),
              onPressed: incrementFontSize,
            ),
            IconButton(
              icon: const Icon(Icons.text_decrease),
              onPressed: decrementFontSize,
            ),
          ],
        ),
      ],
    );
  }
}
