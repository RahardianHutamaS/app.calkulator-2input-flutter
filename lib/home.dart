import 'package:flutter/material.dart';

// Kelas HomePage adalah StatefulWidget yang menampilkan antarmuka pengguna untuk kalkulator sederhana dengan dua bilangan input.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController untuk mengontrol input dari TextField untuk kedua bilangan.
  final TextEditingController firstNumber = TextEditingController();
  final TextEditingController secondNumber = TextEditingController();

  // Variabel result untuk menyimpan hasil operasi matematika.
  double result = 0;

  // Fungsi untuk menavigasi ke halaman hasil.
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
    // Scaffold sebagai kerangka UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator 2 Input'),
      ),
      body: Column(
        children: [
          // TextField untuk input pertama.
          TextField(
            controller: firstNumber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter first number',
            ),
          ),
          // TextField untuk input kedua.
          TextField(
            controller: secondNumber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter second number',
            ),
          ),
          // Tombol-tombol operasi matematika.
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

// Kelas ResultPage adalah StatelessWidget yang menampilkan hasil dari operasi matematika.
class ResultPage extends StatelessWidget {
  final double result;

  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks menampilkan hasil.
            Text('Hasil : $result'),
            const SizedBox(height: 20),
            // Teks instruksi untuk kembali ke halaman sebelumnya.
            Text(
              'Tekan panah untuk kembali',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Tombol ikon untuk kembali.
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
