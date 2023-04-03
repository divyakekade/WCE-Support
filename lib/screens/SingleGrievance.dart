import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/HeadingAndField.dart';
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
  bool openFeedbackForm = false;
  String feedback = "";
  String comment = "";
  void initState() {
    print(widget.grievance);
    id = Provider.of<Auth>(context, listen: false).user_id;
    if (id != null) {
      dynamic user = Provider.of<Auth>(context, listen: false).user;
      role = user['role'];
    }
    if (id == widget.grievance['userID']) {
      sameuser = true;
    }
    if (sameuser && widget.grievance['status'] == 'Completed') {
      takeFeedback = true;
    }
  }

  Future<void> markAknowledge() async {
    try {
      String? id = Provider.of<Auth>(context, listen: false).user_id;
      await Provider.of<Griv>(context, listen: false)
          .changeStatus(id, widget.grievance['_id'], "Acknowledged");

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: "view_grievances")));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  Future<void> markComplete() async {
    try {
      String? id = Provider.of<Auth>(context, listen: false).user_id;

      await Provider.of<Griv>(context, listen: false)
          .changeStatus(id, widget.grievance['_id'], "Completed");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: "view_grievances")));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  Future<void> markClose() async {
    try {
      String? id = Provider.of<Auth>(context, listen: false).user_id;

      await Provider.of<Griv>(context, listen: false)
          .changeStatus(id, widget.grievance['_id'], "Closed");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: "view_grievances")));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
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

  Future<void> saveFeedback() async {
    try {
      await Provider.of<Griv>(context, listen: false)
          .putfeedback(id, widget.grievance['_id'], feedback, comment);
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.008,
              horizontal: MediaQuery.of(context).size.width * 0.02),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.012,
              horizontal: MediaQuery.of(context).size.width * 0.022),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 7, 65, 79), width: 1),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.9,
                        // width: MediaQuery.of(context).size.width * 1,
                        margin: EdgeInsets.symmetric(
                            // vertical: MediaQuery.of(context).size.height * 0.006,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.015),
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.025),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 242, 244, 245),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(159, 157, 157, 1),
                              offset: Offset(0, 2),
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            HeadingAndField(
                                heading: "Grievance:",
                                field: widget.grievance['description']),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            HeadingAndField(
                                heading: "Grievance Section:",
                                field: widget.grievance['section']),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            HeadingAndField(
                                heading: "Grievant:",
                                field: widget.grievance['createrName']),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03),
                            HeadingAndField(
                                heading: "Status:",
                                field: (widget.grievance['status'] !=
                                        "Completed")
                                    ? "${widget.grievance['status']}"
                                    : (widget.grievance['feedback'] == null)
                                        ? "${widget.grievance['status']} and  not Feedbacked"
                                        : "${widget.grievance['status']} and  Feedbacked"),
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
                            widget.grievance['feedback'] != null
                                ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Grievant's Feedback:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                MediaQuery.of(context).size.height *
                                                    0.019),
                                      ),
                                  ],
                                ): const SizedBox(),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.02),
                            widget.grievance['feedback'] != null
                                    ? HeadingAndField(
                                        heading: "Is issue resolved?",
                                        field: widget.grievance['feedback']['review']): const SizedBox(),
                            widget.grievance['feedback'] != null
                                    ? HeadingAndField(
                                        heading: "Comment:",
                                        field: widget.grievance['feedback']['comment']): const SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02),
                      role == "Management"
                          ? widget.grievance['status'] == "Sent"
                              ? ElevatedButton(
                                  onPressed: markAknowledge,
                                  style: buttonStyle,
                                  child: const Text("Acknowledge"))
                              : widget.grievance['status'] == "Acknowledged"
                                  ? ElevatedButton(
                                      onPressed: markComplete,
                                      style: buttonStyle,
                                      child: const Text(
                                          "Completed & Ask Feedback"))
                                  : (widget.grievance['status'] ==
                                              "Completed" &&
                                          widget.grievance['feedback'] != null)
                                      ? ElevatedButton(
                                          onPressed: markClose,
                                          style: buttonStyle,
                                          child: const Text("Close Grievance"))
                                      : const SizedBox()
                          : takeFeedback &&
                                  !openFeedbackForm &&
                                  widget.grievance['feedback'] == null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            openFeedbackForm = true;
                                          });
                                        },
                                        child: const Text("Give Feedback"))
                                  ],
                                )
                              : const SizedBox(),
                      openFeedbackForm && widget.grievance['feedback'] == null
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.01,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.014,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04),
                              decoration: BoxDecoration(
                                color: cardBackground,
                                border: Border.all(
                                    color: const Color.fromARGB(255, 7, 65, 79),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Feedback",
                                          style: TextStyle(
                                              color: headingColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.007,
                                    ),
                                    Row(
                                      children: [
                                        Text('Is your grievance solved?',
                                            style: TextStyle(
                                                color: headingColor,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.036)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                                value: "Yes",
                                                groupValue: feedback,
                                                onChanged: (res) {
                                                  setState(() {
                                                    feedback = res.toString();
                                                    print(feedback);
                                                  });
                                                }),
                                            const Text("Yes")
                                          ],
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08),
                                        Row(
                                          children: [
                                            Radio(
                                                value: "No",
                                                groupValue: feedback,
                                                onChanged: (res) {
                                                  setState(() {
                                                    feedback = res.toString();
                                                    print(feedback);
                                                  });
                                                }),
                                            const Text("No")
                                          ],
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      minLines: 1,
                                      maxLines: 10,
                                      onChanged: (newPass) {
                                        setState(() {
                                          comment = newPass;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                          labelText: 'comment',
                                          contentPadding: EdgeInsets.all(12),
                                          border: OutlineInputBorder(
                                              // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 2.0)),
                                          focusedBorder: OutlineInputBorder(
                                              // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                              borderSide: BorderSide(
                                            color: Colors.black,
                                          ))),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          onPressed: saveFeedback,
                                          style: buttonStyle,
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
