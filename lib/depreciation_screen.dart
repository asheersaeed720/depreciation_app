import 'package:flutter/material.dart';

class DepreciationCalculatorScreen extends StatefulWidget {
  const DepreciationCalculatorScreen({super.key});

  @override
  State<DepreciationCalculatorScreen> createState() => _DepreciationCalculatorScreenState();
}

class _DepreciationCalculatorScreenState extends State<DepreciationCalculatorScreen> {
  TextEditingController costController = TextEditingController();
  TextEditingController salvageValueController = TextEditingController();
  TextEditingController lifeSpanController = TextEditingController();

  String selectedMethod = 'Straight Line';
  double depreciationAmount = 0.0;

  void calculateDepreciation() {
    double cost = double.tryParse(costController.text) ?? 0.0;
    double salvageValue = double.tryParse(salvageValueController.text) ?? 0.0;
    double lifeSpan = double.tryParse(lifeSpanController.text) ?? 1.0;

    if (selectedMethod == 'Straight Line') {
      depreciationAmount = (cost - salvageValue) / lifeSpan;
    } else {}

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Depreciation Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cost'),
            ),
            TextField(
              controller: salvageValueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Scrap Value'),
            ),
            TextField(
              controller: lifeSpanController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Life Span'),
            ),
            DropdownButton<String>(
              value: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
              items: ['Straight Line', 'Reducing Balance']
                  .map((method) => DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDepreciation,
              child: const Text('Calculate Depreciation'),
            ),
            const SizedBox(height: 16),
            Text('Depreciation Amount: ${depreciationAmount.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
