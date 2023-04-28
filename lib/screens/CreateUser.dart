import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:csv/csv.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});
  static String routeUrl = "./create-user";

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

  List<String> rolesList = <String>["select role", "Student", "Management"];
//   Future<void> pickfile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result == null) {
//       return;
//     }
//     print(result.files.first.name);
//     var filePath = result.files.first.path!;
//     final input = File(filePath).openRead();
//     final fields = await input
//         .transform(utf8.decoder)
//         .transform(const CsvToListConverter())
//         .toList();
//     print(fields.length);
//     for (int i = 1; i < fields.length; i++) {
//       String firstName = fields[i][0];
//       String lastName = fields[i][1];
//       String userName = fields[i][2];
//       String email = fields[i][3];
//       String mobileNo = fields[i][4].toString();
//       String password = fields[i][5].toString();
//       String role = fields[i][6];
//       String department = fields[i][7];
//       String year = fields[i][8];
//             print(firstName);
//       final user = {
//         "firstName": firstName,
//         "lastName": lastName,
//         "username": userName,
//         "email": email,
//         "password": password,
//         "role": role,
//         "department": department,
//         "year": role == "Student" ? year : "other",
//         "mobileNo": mobileNo
//       };
//       try {
//         await Provider.of<Auth>(context, listen: false).createUser(user);
        
//         // Navigator.of(context).push(MaterialPageRoute(
//         //     builder: (context) =>
//         //         SideMenuNavigation(loadedPage: 'create_user')));
//       } catch (error) {
//         showErrorDialogBox2(error.toString(), context);
//       }
//     }
//     // User selected an Excel sheet, parse the data
// showCustomSnackbar(1, "All user created successfully!", context);
//     // Send the data to the backend
//   }

  Future<void> createUser() async {
    final user = {
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "password": password,
      "department": department,
      "year":  year ,
      "mobileNo": mobileNo
    };
    try {
      await Provider.of<Auth>(context, listen: false).createUser(user);
      showCustomSnackbar(1, "New user created successfully!", context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SideMenuNavigation(loadedPage: 'users_management')));
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
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
                  'Create New User',
                  style: headingTextStyle,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        // vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 246, 246),
                      border: Border.all(
                          color: Color.fromARGB(255, 7, 65, 79), width: 1),
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
                                        MediaQuery.of(context).size.height *
                                            0.018),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextFormField(
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
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
                                      focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      ))),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextFormField(
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
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
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
                            keyboardType: TextInputType.number,
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
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
                            obscureText: true,
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                ))),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          // DropdownButtonFormField(
                          //   isExpanded: true,
                          //   items: rolesList.map((value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(
                          //         value,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     );
                          //   }).toList(),
                          //   value: role,
                          //   onChanged: (String? value) {
                          //     setState(() {
                          //       role = value!;
                          //     });
                          //     if (role == "Student") {
                          //       setState(() {
                          //         showYearBranch = true;
                          //       });
                          //     } else {
                          //       setState(() {
                          //         showYearBranch = false;
                          //         year = "select year";
                          //         department = "select department";
                          //       });
                          //     }
                          //   },
                          //   decoration: const InputDecoration(
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
                          //   height: MediaQuery.of(context).size.height * 0.025,
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0)),
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
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0)),
                                      focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      ))),
                                ),
                               SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025),
                             
                          ElevatedButton(
                            onPressed: createUser,
                            style: buttonStyle,
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: pickfile,
                          //   style: buttonStyle,
                          //   child: Text(
                          //     "Upload user ",
                          //     style: TextStyle(
                          //         fontSize: MediaQuery.of(context).size.height *
                          //             0.025),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
    );
  }
}
