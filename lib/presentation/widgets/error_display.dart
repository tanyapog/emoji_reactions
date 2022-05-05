import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String error;
  final String details;

  const ErrorDisplay({Key? key, required this.error, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.report_problem_rounded, size: 76.0, color: Colors.red),
            Text(error,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(details),
          ],
        ),
      ),
    );
  }
}
