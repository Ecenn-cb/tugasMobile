import 'package:flutter/material.dart';

void main() {
  runApp(const KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      home: KalkulatorScreen(),
    );
  }
}

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  final _berat = TextEditingController();
  final _tinggi = TextEditingController();

  double? _hasilPria;
  String? _keteranganPria;

  double? _hasilPerempuan;
  String? _keteranganPerempuan;

  void resetKalku() {
    setState(() {
      _berat.clear();
      _tinggi.clear();
      _hasilPria = null;
      _hasilPerempuan = null;
      _keteranganPria = null;
      _keteranganPerempuan = null;
    });
  }

  void hitungBMI() {
    final double weight = double.tryParse(_berat.text) ?? 0;
    final double height = double.tryParse(_tinggi.text) ?? 0;

    if (weight <= 0 || height <= 0) {
      setState(() {
        _hasilPria = null;
        _hasilPerempuan = null;
        _keteranganPria = "Masukkan Data yang Valid";
        _keteranganPerempuan = "Masukkan Data yang Valid";
      });
      return;
    }

    final double heightInM = height / 100;

    // hitung lakilaki
    final double bmiPria = weight / (heightInM * heightInM);
    String ketPria;
    if (bmiPria < 18.5) {
      ketPria = "Anda Kurus";
    } else if (bmiPria < 25 && bmiPria > 18.5) {
      ketPria = "Anda Ideal";
    } else if (bmiPria < 29.9 && bmiPria > 25) {
      ketPria = "Anda Gemuk";
    } else {
      ketPria = "Anda Obesitas";
    }
    //hitung perempuan
    final double bmiPerempuan = weight / (heightInM * heightInM);
    String ketPerempuan;
    if (bmiPerempuan < 18.0) {
      ketPerempuan = "Anda Kurus";
    } else if (bmiPerempuan < 24 && bmiPerempuan > 18) {
      ketPerempuan = "Anda Ideal";
    } else if (bmiPerempuan < 28 && bmiPerempuan > 24.1) {
      ketPerempuan = "Anda Gemuk";
    } else {
      ketPerempuan = "Anda Obesitas";
    }

    setState(() {
      _hasilPria = bmiPria;
      _hasilPerempuan = bmiPerempuan;
      _keteranganPria = ketPria;
      _keteranganPerempuan = ketPerempuan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _berat,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.monitor_weight),
                      labelText: 'Berat Badan (Kg)',
                    ),
                  ),
                  TextField(
                    controller: _tinggi,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.height),
                      labelText: 'Tinggi Badan (Cm)',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungBMI,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetKalku,
              child: const Text('Reset'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Laki-laki
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Laki-laki",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _hasilPria?.toStringAsFixed(1) ?? '--',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(_keteranganPria ?? "Masukkan Data"),
                      ],
                    ),
                  ),
                ),
                // Perempuan
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Perempuan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _hasilPerempuan?.toStringAsFixed(1) ?? '--',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(_keteranganPerempuan ?? "Masukkan Data"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              "Melsen",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "5520123022",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "IF-A-2023 == MOBILE_1",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
