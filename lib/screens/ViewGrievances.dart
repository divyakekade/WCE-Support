import 'package:flutter/material.dart';

class ViewGrievances extends StatefulWidget {
  const ViewGrievances({super.key});

  @override
  State<ViewGrievances> createState() => _ViewGrievancesState();
}

class _ViewGrievancesState extends State<ViewGrievances> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("View Grievances"),
      ),
    );
  }
}