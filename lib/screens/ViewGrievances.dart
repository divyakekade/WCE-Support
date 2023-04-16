import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleGrievance.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class ViewGrievances extends StatefulWidget {
  const ViewGrievances({super.key});
  static String routeUrl = "./view-grievances";

  @override
  State<ViewGrievances> createState() => _ViewGrievancesState();
}

class _ViewGrievancesState extends State<ViewGrievances> {
  bool _isInit = true;
  bool isLoading = false;
  String role = "Student";
  bool myassignment = false;
  dynamic user;
  @override
  void initState() {
    super.initState();
    user = Provider.of<Auth>(context, listen: false).user;

    if (user != null) {
      role = user['role'];
      print(role);
    }
  }

  void viewMyAssignment() {
    setState(() {
      myassignment = (myassignment == false);
    });
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });

      Provider.of<Griv>(context).viewGrievances().then((_) {
        setState(() {
          isLoading = false;
        });
      }).catchError((error) {
        showErrorDialogBox2(error.toString(), context);
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<bool> backNavigation() async {
      Navigator.of(context).popAndPushNamed(HomeScreen.routeUrl);
       return false;
  }
  
  @override
  Widget build(BuildContext context) {
    List list = Provider.of<Griv>(context).sendGrievanceList();
    return Scaffold(
      body: WillPopScope(
        onWillPop: backNavigation,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: backgroundColor),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.0052,
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      decoration: headingBoxDecoration,
                      child: Text(
                        'View Grievances',
                        style: headingTextStyle,
                      ),
                    ),
                    role == "Management"
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.035),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: viewMyAssignment,
                                  style: buttonStyle,
                                  child: myassignment
                                      ? const Text("All Grievance")
                                      : const Text("My Grievances"),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Expanded(
                        // child: SingleChildScrollView(
                        // child: Container(
                        //     height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              dynamic l = list[index];
                              return (myassignment == false) ||
                                      (list[index]['section'] ==
                                          user['department'])
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleGrievance(
                                                        grievance: list[index])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.035),
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        decoration: BoxDecoration(
                                          // color: cardColor,
                                          color: const Color.fromARGB(255, 228, 229, 230),
                                          border: Border.all(
                                              color: headingColor, width: 0.5),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  194, 194, 194, 1),
                                              offset: Offset(2, 4),
                                              blurRadius: 5,
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(children: [
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.78,
                                                      child: Text(
                                                        list[index]['subject'],
                                                        style: TextStyle(
                                                            color: const Color
                                                                    .fromARGB(255,
                                                                15, 100, 112),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02),
                                                      )),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.02),
                                                  SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.78,
                                                    child: Text(
                                                      list[index]['description'],
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.018),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.02),
                                                  SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.78,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Status: ",
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.016,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Text(
                                                          (l['status'] !=
                                                                  "Completed")
                                                              ? "${l['status']}"
                                                              : (l['feedback'] ==
                                                                      null)
                                                                  ? "${l['status']} and  not Feedbacked"
                                                                  : "${l['status']} and  Feedbacked",
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.016,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ]),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.022,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  decoration: BoxDecoration(
                                                      color: imagebutton,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    SingleGrievance(
                                                                        grievance:
                                                                            list[
                                                                                index])));
                                                      },
                                                      child: const Icon(
                                                        Icons.chevron_right,
                                                        size: 30,
                                                        color: headingColor,
                                                      )),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    list[index]['date'],
                                                    style: TextStyle(
                                                        color: headingColor,
                                                        fontSize:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.014),
                                                  ),
                                                  Text(
                                                    list[index]['time'],
                                                    style: TextStyle(
                                                        color: headingColor,
                                                        fontSize:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.014),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container();
                            }))
                    // ),
                  ],
                ),
              ]),
      ),
    );
  }
}
