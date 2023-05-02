import 'package:flutter/material.dart';
import 'package:login_crypto/coinrates.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  TextEditingController celsiusController = TextEditingController();
  double bdt = 0;

  void convertTemperature() {
    double btc = double.tryParse(celsiusController.text) ?? 0;
    setState(() {
      bdt = btc * .0000003308240784384908984;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BTC - BDT Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Manipulate()));
                },
                child: const Text("Show currency rates")),
            const SizedBox(height: 30),
            const Text('Enter the BDT amount:'),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: TextField(
                controller: celsiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '0',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 30),
            Text('BTC: $bdt B', style: const TextStyle(fontSize: 69)),
          ],
        ),
      ),
    );
  }
}
