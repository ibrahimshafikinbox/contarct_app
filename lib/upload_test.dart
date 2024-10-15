// ContractSummaryScreen.dart
import 'package:flutter/material.dart';

class ContractSummaryScreen extends StatelessWidget {
  final String contractName;
  final String otherParties;
  final String concerns;
  final String goals;
  final String questions;
  final String additionalInfo;
  final String? contractType;

  const ContractSummaryScreen({
    Key? key,
    required this.contractName,
    required this.otherParties,
    required this.concerns,
    required this.goals,
    required this.questions,
    required this.additionalInfo,
    this.contractType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contract Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contract Name: $contractName'),
            SizedBox(height: 10),
            Text('Other Parties: $otherParties'),
            SizedBox(height: 10),
            Text('Concerns: $concerns'),
            SizedBox(height: 10),
            Text('Goals: $goals'),
            SizedBox(height: 10),
            Text('Questions: $questions'),
            SizedBox(height: 10),
            Text('Additional Info: $additionalInfo'),
            SizedBox(height: 10),
            Text('Contract Type: ${contractType ?? 'Not specified'}'),
          ],
        ),
      ),
    );
  }
}
