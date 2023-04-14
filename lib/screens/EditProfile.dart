import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/ChangePassword.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String firstName = "Divya";
  String lastName = "Kekade";
  String username = "2020BTECS00038";
  String email = "divya.kekade@walchandsangli.ac.in";
  String password = "";
  String role = "Student";
  String department = "Computer Science & Engineering";
  String year = "Third Year";
  String mobileNo = "8626061856";
  bool showYearBranch = false;
  bool editing = false;
  dynamic user;

  List<String> departmentsList = <String>[
    "select department",
    "Computer Science & Engineering",
    "Information Technology",
    "Electronics",
    "Electrical",
    "Mechanical",
    "Civil",
    "Hostel",
    "Exam Cell"
  ];

  List<String> yearsList = <String>[
    "select year",
    "First Year",
    "Second Year",
    "Third Year",
    "Final Year",
  ];

  List<String> rolesList = <String>["select role", "Student", "Management"];

  Future<void> editProfile() async {
    if (mobileNo != user['mobile'] ||
        year != user['year'] ||
        department != user['department']) {
      try {
        await Provider.of<Auth>(context, listen: false)
            .updateProfile(mobileNo, department, year);
        setState(() {
          editing = false;
        });
      } catch (error) {
        showErrorDialogBox2(error.toString(), context);
      }

    }
    else{
      setState(() {
        editing = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Provider.of<Auth>(context, listen: false).user;
    print(user);
    firstName = user['firstname'];
    lastName = user['lastname'];
    username = user['username'];
    email = user['email'];
    mobileNo = user['mobile'];
    role = user['role'];
    department = user['department'];
    year = user['year'];
  }

  @override
  Widget build(BuildContext context) {
    if (role == "Student") {
      setState(() {
        showYearBranch = true;
      });
    }
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(children: [
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
                'Your Profile',
                style: headingTextStyle,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          // vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 246, 246),
                        border: Border.all(
                            color: const Color.fromARGB(255, 7, 65, 79),
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        editing = true;
                                      });
                                    },
                                    icon: const Icon(Icons.edit),
                                    color:
                                        const Color.fromARGB(255, 75, 75, 75),
                                    iconSize: 28,
                                  ),
                                ]),
                            Row(
                              children: [
                                Text(
                                  username,
                                  style: TextStyle(
                                      color: headingColor,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
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
                                  MediaQuery.of(context).size.height * 0.009,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.grey),
                                    initialValue: firstName,
                                    onChanged: (name) {
                                      setState(() {
                                        firstName = name;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        enabled: false,
                                        labelText: 'first name',
                                        contentPadding:
                                            EdgeInsets.all(12),
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
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    initialValue: lastName,
                                    style: const TextStyle(color: Colors.grey),
                                    onChanged: (name) {
                                      setState(() {
                                        lastName = name;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        enabled: false,
                                        labelText: 'last name',
                                        contentPadding:
                                             EdgeInsets.all(12),
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
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              initialValue: email,
                              onChanged: (mail) {
                                setState(() {
                                  email = mail;
                                });
                              },
                              decoration: const InputDecoration(
                                  enabled: false,
                                  labelText: 'email',
                                  contentPadding: EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            TextFormField(
                              style: !editing
                                  ? const TextStyle(color: Colors.grey)
                                  : null,
                              initialValue: mobileNo,
                              onChanged: (mobile) {
                                setState(() {
                                  mobileNo = mobile;
                                });
                              },
                              decoration: InputDecoration(
                                  enabled: editing,
                                  labelText: 'mobile no.',
                                  contentPadding: const EdgeInsets.all(12),
                                  border: const OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0)),
                                  focusedBorder: const OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            DropdownButtonFormField(
                              isExpanded: true,
                              items: rolesList.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              }).toList(),
                              value: role,
                              onChanged: editing
                                  ? (String? value) {
                                      setState(() {
                                        role = value!;
                                      });
                                      if (role == "Student") {
                                        setState(() {
                                          showYearBranch = true;
                                        });
                                      } else {
                                        setState(() {
                                          showYearBranch = false;
                                          year = "select year";
                                          department = "select department";
                                        });
                                      }
                                    }
                                  : null,
                              decoration: const InputDecoration(
                                  enabled: false,
                                  labelText: 'select role',
                                  contentPadding: EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            DropdownButtonFormField(
                              isExpanded: true,
                              items: departmentsList.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              value: department,
                              onChanged: editing
                                  ? (String? value) {
                                      setState(() {
                                        department = value!;
                                      });
                                    }
                                  : null,
                              decoration: InputDecoration(
                                  enabled: editing,
                                  labelText: 'select department',
                                  contentPadding: const EdgeInsets.all(12),
                                  border: const OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0)),
                                  focusedBorder: const OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            showYearBranch
                                ? DropdownButtonFormField(
                                    isExpanded: true,
                                    items: yearsList.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    value: year,
                                    onChanged: editing
                                        ? (String? value) {
                                            setState(() {
                                              year = value!;
                                            });
                                          }
                                        : null,
                                    decoration: InputDecoration(
                                        enabled: editing,
                                        labelText: 'select year',
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        border: const OutlineInputBorder(
                                            // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 2.0)),
                                        focusedBorder: const OutlineInputBorder(
                                            // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                            borderSide: BorderSide(
                                          color: Colors.black,
                                        ))),
                                  )
                                : const SizedBox(),
                            showYearBranch
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025)
                                : const SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: editProfile,
                                  style: buttonStyle,
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.025),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.003,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChangePassword()));
                        },
                        style: buttonStyle,
                        child: const Text("Change Password"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
