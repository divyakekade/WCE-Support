import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';

class ViewGrievances extends StatefulWidget {
  const ViewGrievances({super.key});

  @override
  State<ViewGrievances> createState() => _ViewGrievancesState();
}

class _ViewGrievancesState extends State<ViewGrievances> {
  List list = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.04),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.005,
                horizontal: MediaQuery.of(context).size.width * 0.04),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(159, 157, 157, 1),
                  offset: Offset(2, 4),
                  blurRadius: 4,
                )
              ],
              color: card_background,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Colors.black, width: 1)
            ),
            child: Text(
              'View Grievances',
              style: TextStyle(
                shadows: const [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    color: Color.fromRGBO(159, 157, 157, 1),
                  )
                ],
                color: heading_color,
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.width * 0.055,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.035),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Grievances Assigned To Me")),
              ],
            ),
          ),
          Expanded(
              // child: SingleChildScrollView(
              // child: Container(
              //     height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    dynamic l = list[index];
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.008,
                          horizontal:
                              MediaQuery.of(context).size.width * 0.035),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.04),
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
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              "Subject",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Section",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Grievant's name",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ]),
                    );
                  }))
          // ),
        ],
      ),
    );
  }
}
