import 'package:flutter/material.dart';

class PutGrievance extends StatefulWidget {
  const PutGrievance({super.key});

  @override
  State<PutGrievance> createState() => _PutGrievanceState();
}

class _PutGrievanceState extends State<PutGrievance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Put Grievance"),
      ),
    );
  }
}