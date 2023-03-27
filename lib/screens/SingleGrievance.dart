import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/Appbar.dart';

class SingleGrievance extends StatefulWidget {
  const SingleGrievance({super.key, required this.grievance});
  final String grievance;
  @override
  State<SingleGrievance> createState() => _SingleGrievanceState();
}

class _SingleGrievanceState extends State<SingleGrievance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Appbar(),
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
              Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      // width: MediaQuery.of(context).size.width * 1,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.015,
                        // horizontal: MediaQuery.of(context).size.width * 0.
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03),
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
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Grievance: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.025),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  "jdnfviuarjns jdhfiuqhneicmos bd73ed jksdhiuewhf ybsduydwe uhse7fn3e iunsd8nfnnw nwuehfenf unweuefne00",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Grievance Section: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.025),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  "jdnfviuarjns jdhfiuqhneicmos",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Grievant: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.025),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  "jdnfviuarjns jdhfiuqhneicmos bd73ed",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Status: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                                Text(
                                  "Completed",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.05),
                            Center(
                              child: Container(
                                width: 250,
                                // height: 250,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 7, 65, 79),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    ('assets/walchand.jfif'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.05),
                            Row(
                              children: [
                                Text(
                                  "Grievant's Feedback: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.025),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  "jdnfviuarjns jdhfiuqhneicmos bd73ed asb ashqwdiun x hbsyxbsux sdusd bsdwdsjx uyusahduqdwn ssdunsska",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                )),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Ackowledge")),
                    // ElevatedButton(onPressed: () {}, child: Text("Mark Completed & Get Feedback"))
                  ],
                ),
            ],
          ),
        ));
  }
}
