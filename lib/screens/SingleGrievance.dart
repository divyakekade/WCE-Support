import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';

class SingleGrievance extends StatefulWidget {
  const SingleGrievance({super.key});

  @override
  State<SingleGrievance> createState() => _SingleGrievanceState();
}

class _SingleGrievanceState extends State<SingleGrievance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.025,
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Subject of Grievance",
                style: TextStyle(
                    color: heading_color,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Divider(
            height: 4,
            thickness: 1.5,
            color: Colors.black,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 1,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.015,
                // horizontal: MediaQuery.of(context).size.width * 0.
                ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 230, 230),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(159, 157, 157, 1),
                  offset: Offset(2, 4),
                  blurRadius: 4,
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text("Hello"),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
