import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class SingleGrievance extends StatefulWidget {
  const SingleGrievance({super.key, required this.grievance});
  final grievance;
  @override
  State<SingleGrievance> createState() => _SingleGrievanceState();
}

class _SingleGrievanceState extends State<SingleGrievance> {
  bool sameuser = false;
  String? id;
  String role = "Student";
  bool takeFeedback = false;
  void initState() {
    print(widget.grievance);
    String? id = Provider.of<Auth>(context, listen: false).user_id;
    if (id != null) {
      dynamic user = Provider.of<Auth>(context, listen: false).user;
      role = user['role'];
    }
    if (id == widget.grievance['userID']) {
      sameuser = true;
    }
    if (sameuser && widget.grievance['status'] == 'Complete') {
      takeFeedback = true;
    }
  }

  Future<void> deleteGrievance() async {
    try {
      await Provider.of<Griv>(context, listen: false)
          .deleteGrievance(widget.grievance['userID'], widget.grievance['_id']);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: "view_grievances")));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.008,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: MediaQuery.of(context).size.width * 0.032),
        decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromARGB(255, 7, 65, 79), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            sameuser
                ? (Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      onPressed: deleteGrievance,
                      icon: const Icon(Icons.delete),
                      color: const Color.fromARGB(255, 75, 75, 75),
                      iconSize: 32,
                    ),
                  ]))
                : Row(),
            Row(
              children: [
                Text(
                  "${widget.grievance["subject"]}",
                  style: TextStyle(
                      color: headingColor,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.9,
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
                                "${widget.grievance['subject']}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017),
                              )),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03),
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
                                "${widget.grievance['section']}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017),
                              )),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03),
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
                                "${widget.grievance['createrName']}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017),
                              )),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03),
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
                                "${widget.grievance['status']}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05),
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
                              height: MediaQuery.of(context).size.width * 0.05),
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
                                "jdkvnieufn nusdon  iuwdo2uf bcdu82nrfp, ndciuen29r",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017),
                              )),
                        ],
                      ),
                    ),
                    role == "Management"
                        ? widget.grievance['status'] == "Sent"
                            ? ElevatedButton(
                                onPressed: () {},
                                style: buttonStyle,
                                child: const Text("Acknowledge"))
                            : widget.grievance['status'] == "Acknowledged"
                                ? ElevatedButton(
                                    onPressed: () {},
                                    style: buttonStyle,
                                    child:
                                        const Text("Completed & Ask Feedback"))
                                : widget.grievance['status'] == "Completed"
                                    ? ElevatedButton(
                                        onPressed: () {},
                                        style: buttonStyle,
                                        child: const Text("Close Grievance"))
                                    : const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      takeFeedback = true;
                                    });
                                  },
                                  child: const Text("Give Feedback"))
                            ],
                          ),
                    takeFeedback ? TextFormField() : const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
