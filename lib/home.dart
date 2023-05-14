import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstNumber = TextEditingController();
  final TextEditingController secondNumber = TextEditingController();

  double result = 0;

  void _navigateToResultPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(result: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator 2 Input'),
      ),
     body: Column(
      children: [
        TextField(
          controller: firstNumber,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter first number',
          ),
        ),
        TextField(
          controller: secondNumber,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter second number',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                double num1 = double.parse(firstNumber.text);
                double num2 = double.parse(secondNumber.text);
                setState(() {
                  result = num1 + num2;
                });
                _navigateToResultPage();
              },
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                double num1 = double.parse(firstNumber.text);
                double num2 = double.parse(secondNumber.text);
                setState(() {
                  result = num1 - num2;
                });
                _navigateToResultPage();
              },
              child: const Text('-'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                double num1 = double.parse(firstNumber.text);
                double num2 = double.parse(secondNumber.text);
                setState(() {
                  result = num1 * num2;
                });
                _navigateToResultPage();
              },
              child: const Text('x'),
            ),
            ElevatedButton(
              onPressed: () {
                double num1 = double.parse(firstNumber.text);
                double num2 = double.parse(secondNumber.text);
                setState(() {
                  result = num1 / num2;
                });
                _navigateToResultPage();
              },
              child: const Text('/'),
            ),
          ],
        ),
      ],
    ),
  );
 }
}

class ResultPage extends StatelessWidget {
  final double result;

  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hasil : $result'),
            const SizedBox(height: 20),
            Text(
              'Tekan panah untuk kembali',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
