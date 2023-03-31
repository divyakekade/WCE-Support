import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  String firstName = "";
  String lastName = ""; 
  String username = "";
  String email = "";
  String password = "";
  String role = "select role";
  String department = "select department";
  String year = "select year";
  String mobileNo = "";
  bool showYearBranch = false;

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
    "First year",
    "Second year",
    "Third Year",
    "Final Year",
  ];
  
  List<String> rolesList = <String>[
    "select role",
    "Student",
    "Management"
  ];

  createUser() {
    print(firstName);
    print(lastName);
    print(username);
    print(email);
    print(password);
    print(role);
    print(department);
    print(year);
    print(mobileNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Create New User',
              style: headingTextStyle,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Color.fromARGB(255, 7, 65, 79), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Enter user's details below",
                            style: TextStyle(
                                color: headingColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.009,
                      ),
                      TextFormField(
                        onChanged: (name) {
                          setState(() {
                            firstName = name;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'first name',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      TextFormField(
                        onChanged: (name) {
                          setState(() {
                            lastName = name;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'last name',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      TextFormField(
                        onChanged: (name) {
                          setState(() {
                            username = name;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'username',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      TextFormField(
                        onChanged: (mail) {
                          setState(() {
                            email = mail;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'email',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      TextFormField(
                        onChanged: (pass) {
                          setState(() {
                            password = pass;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'password',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      DropdownButtonFormField(
                        isExpanded: true,
                        items: rolesList.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        value: role,
                        onChanged: (String? value) {
                          setState(() {
                            role = value!;
                          });
                          if(role=="Student") {
                            setState(() {
                              showYearBranch=true;
                            });
                          } else {
                            setState(() {
                              showYearBranch= false;
                              year = "select year";
                              department = "select department";
                            });
                          }
                        },
                        decoration: const InputDecoration(
                            labelText: 'select role',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
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
                        onChanged: (String? value) {
                          setState(() {
                            department = value!;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'select department',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      showYearBranch ?
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
                        onChanged: (String? value) {
                          setState(() {
                            year = value!;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'select year',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ) :
                      const SizedBox(
                        
                      ),
                      showYearBranch ? SizedBox(height: MediaQuery.of(context).size.height * 0.025) : const SizedBox(),
                      TextFormField(
                        onChanged: (mobile) {
                          setState(() {
                            mobileNo = mobile;
                          });
                        },
                        decoration: const InputDecoration(
                            labelText: 'mobile no.',
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      ElevatedButton(
                        onPressed: createUser,
                        style: buttonStyle,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.025),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
