import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

import 'SideMenuNavigation.dart';

class EditProfileManagement extends StatefulWidget {
  EditProfileManagement({super.key, required this.user});
  dynamic user;
  static String routeUrl = "./edit-profile-management";

  @override
  State<EditProfileManagement> createState() => _EditProfileManagementState();
}

class _EditProfileManagementState extends State<EditProfileManagement> {
  String firstName = "Divya";
  String lastName = "Kekade";
  String username = "2020BTECS00038";
  String email = "divya.kekade@walchandsangli.ac.in";
  String password = "";
  String role = "Student";
  String department = "Computer Science & Engineering";
  String year = "Third Year";
  String mobileNo = "8626061856";
  bool showYearBranch = true;
  bool editing = true;
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
    if (mobileNo != widget.user['mobile'] ||
        year != widget.user['year'] ||
        department != widget.user['department']) {
      try {
        await Provider.of<Auth>(context, listen: false)
            .updateProfile(mobileNo, department, year);
        showCustomSnackbar(1, "Profile updated successfully!", context);
        setState(() {
          editing = false;
        });
      } catch (error) {
        showErrorDialogBox2(error.toString(), context);
      }
    } else {
      setState(() {
        editing = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // user = Provider.of<Auth>(context, listen: false).user;
    // print(widget.user);
    firstName = widget.user['firstname'];
    lastName = widget.user['lastname'];
    username = widget.user['username'];
    email = widget.user['email'];
    mobileNo = widget.user['mobile'];
    department = widget.user['department'];
    year = widget.user['year'];
  }

  Future<void> deleteUser() async {
    try {
      dynamic user = Provider.of<Auth>(context, listen: false).user;
      print(widget.user['_id']);
      await Provider.of<Auth>(context, listen: false)
      
          .deleteUser(user['_id'], widget.user['_id']);
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SideMenuNavigation(loadedPage: 'users_management')));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (role == "Student") {
    //   setState(() {
    //     showYearBranch = true;
    //   });
    // }
    return Scaffold(
      appBar: const Appbar(),
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
                'Edit User Profile',
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
                                    onPressed: deleteUser,
                                    icon: const Icon(Icons.delete),
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
                            TextFormField(
                              style: !editing
                                  ? const TextStyle(color: Colors.grey)
                                  : null,
                              initialValue: username,
                              onChanged: (un) {
                                setState(() {
                                  username = un;
                                });
                              },
                              decoration: InputDecoration(
                                  enabled: editing,
                                  labelText: 'username',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    // style: const TextStyle(color: Colors.grey),
                                    initialValue: firstName,
                                    onChanged: (name) {
                                      setState(() {
                                        firstName = name;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        enabled: editing,
                                        labelText: 'first name',
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
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    initialValue: lastName,
                                    // style: const TextStyle(color: Colors.grey),
                                    onChanged: (name) {
                                      setState(() {
                                        lastName = name;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        enabled: editing,
                                        labelText: 'last name',
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
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            TextFormField(
                              // style: const TextStyle(color: Colors.grey),
                              initialValue: email,
                              onChanged: (mail) {
                                setState(() {
                                  email = mail;
                                });
                              },
                              decoration: InputDecoration(
                                  enabled: editing,
                                  labelText: 'email',
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
                            // DropdownButtonFormField(
                            //   isExpanded: true,
                            //   items: rolesList.map((value) {
                            //     return DropdownMenuItem<String>(
                            //       value: value,
                            //       child: Text(
                            //         value,
                            //         overflow: TextOverflow.ellipsis,
                            //         // style: const TextStyle(color: Colors.grey),
                            //       ),
                            //     );
                            //   }).toList(),
                            //   value: role,
                            //   onChanged: editing
                            //       ? (String? value) {
                            //           setState(() {
                            //             role = value!;
                            //           });
                            //           if (role == "Student") {
                            //             setState(() {
                            //               showYearBranch = true;
                            //             });
                            //           } else {
                            //             setState(() {
                            //               showYearBranch = false;
                            //               year = "select year";
                            //               department = "select department";
                            //             });
                            //           }
                            //         }
                            //       : null,
                            //   decoration: const InputDecoration(
                            //       enabled: false,
                            //       labelText: 'select role',
                            //       contentPadding: EdgeInsets.all(12),
                            //       border: OutlineInputBorder(
                            //           // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            //           borderSide: BorderSide(
                            //               color: Colors.black, width: 2.0)),
                            //       focusedBorder: OutlineInputBorder(
                            //           // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            //           borderSide: BorderSide(
                            //         color: Colors.black,
                            //       ))),
                            // ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.025,
                            // ),
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
                            DropdownButtonFormField(
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
                                    MediaQuery.of(context).size.height * 0.025),
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
