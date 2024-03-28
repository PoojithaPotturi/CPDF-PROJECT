import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0.0;
  String bmiDescription = '';

  bool showBmi = false;

  void calculateBmi() {
    double height = double.parse(heightController.text) / 100; // Convert height to meters
    double weight = double.parse(weightController.text);
    bmi = weight / (height * height);
    bmiDescription = getBmiDescription(bmi);
    showBmi = true;
  }

  String getBmiDescription(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Height in cm',
              ),
              controller: heightController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Weight in KG',
              ),
              controller: weightController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateBmi();
                });
              },
              child: Text(
                'Calculate',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            showBmi
                ? Column(
                    children: [
                      Text(
                        "BMI: " + bmi.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        bmiDescription,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}