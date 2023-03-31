import 'dart:io';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SingleGrievance.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class ViewGrievances extends StatefulWidget {
  const ViewGrievances({super.key});

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

  @override
  Widget build(BuildContext context) {
    List list = Provider.of<Griv>(context).sendGrievanceList();
    return Scaffold(
      body: Column(
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
                      horizontal: MediaQuery.of(context).size.width * 0.035),
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
                            (list[index]['section'] == user['department'])
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.008,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.035),
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04),
                            decoration: BoxDecoration(
                              color: cardColor,
                              boxShadow:const [
                                BoxShadow(
                                  color: Color.fromRGBO(159, 157, 157, 1),
                                  offset: Offset(2, 4),
                                  blurRadius: 4,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Text(
                                    list[index]['subject'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  )),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.02),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  list[index]['description'],
                                  maxLines: 2,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018),
                                ),
                              ),
                              // SizedBox(
                              //     height:
                              //         MediaQuery.of(context).size.width * 0.02),
                              // Row(
                              //   children: [
                              //     Text(
                              //       "Status: ",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize:
                              //               MediaQuery.of(context).size.height *
                              //                   0.018),
                              //     ),
                              //     Text(
                              //       list[index]['status'],
                              //       style: TextStyle(
                              //           fontSize:
                              //               MediaQuery.of(context).size.height *
                              //                   0.018),
                              //     ),
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      onPressed: () => {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleGrievance(
                                                            grievance:
                                                                list[index])))
                                          },
                                      style: buttonStyle,
                                      child: const Text("View Details"))
                                ],
                              )
                            ]),
                          )
                        : Container();
                  }))
          // ),
        ],
      ),
    );
  }
}
