import 'dart:io';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/CustomSnackbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'package:csv/csv.dart';
// import 'package:excel/excel.dart' hide Border;

class UploadUsersData extends StatefulWidget {
  const UploadUsersData({super.key});
  static String routeUrl = "./upload-users-data";

  @override
  State<UploadUsersData> createState() => _UploadUsersDataState();
}

class _UploadUsersDataState extends State<UploadUsersData> {
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
  String fileName = "";
  List users = [];
  List<String> rolesList = <String>["select role", "Student", "Management"];
  Future<void> pickfile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv']);
    if (result == null) {
      return;
    }
    print(result.files.first.name);
    setState(() {
      fileName = result.files.first.name;
    });
    var filePath = result.files.first.path!;
    final input = File(filePath).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    print(fields.length);
    users = [];
    for (int i = 1; i < fields.length; i++) {
      String firstName = fields[i][0];
      String lastName = fields[i][1];
      String userName = fields[i][2];
      String email = fields[i][3];
      String mobileNo = fields[i][4].toString();
      String password = fields[i][5].toString();
      String role = fields[i][6];
      String department = fields[i][7];
      String year = fields[i][8];
      print(firstName);
      final user = {
        "firstname": firstName,
        "lastname": lastName,
        "username": userName,
        "email": email,
        "password": password,
        "department": department,
        "year": year,
        "mobile": mobileNo
      };
      users.add(user);
      // try {
      //   await Provider.of<Auth>(context, listen: false).createUser(user);
      //   // Navigator.of(context).push(MaterialPageRoute(
      //   //     builder: (context) =>
      //   //         SideMenuNavigation(loadedPage: 'create_user')));
      // } catch (error) {
      //   showErrorDialogBox2(error.toString(), context);
      // }
    }
    // print(users);
    // createAllUsers(users);
  }

  Future<void> createAllUsers() async {
    // print(users);
    try {
      dynamic user = Provider.of<Auth>(context, listen: false).user;
      var reentry = await Provider.of<Auth>(context, listen: false)
          .storeAllUsers(users, user['_id']);
      print(reentry);
      showCustomSnackbar(1, "Users added successfully!", context);
    } catch (error) {
      showErrorDialogBox2(error.toString(), context);
    }
  }

  openInfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height*0.3,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: imagebutton,
                            borderRadius: BorderRadius.circular(50)),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              size: 28,
                              color: headingColor,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  const Text("How to upload CSV file?", style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  const Text("Instructions to upload CSV file.")
                ],
              ),
            ),
          );
        });
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
                'Upload Users Data',
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
                    color: const Color.fromARGB(255, 247, 246, 246),
                    border: Border.all(
                        color: const Color.fromARGB(255, 7, 65, 79), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: openInfo,
                                icon: const Icon(Icons.info),
                                color: const Color.fromARGB(255, 75, 75, 75),
                                iconSize: 30,
                              ),
                            ]),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Upload the CSV file of users' deatils to add new users",
                                style: TextStyle(
                                    color: headingColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.018),
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: pickfile,
                                  style: secondButtonStyle,
                                  icon: const Icon(Icons.upload_file_outlined),
                                  label: Text(
                                    "Choose File",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  )),
                            ]),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.83,
                              child: Center(
                                child: fileName != ""
                                    ? Text(
                                        fileName,
                                        style: TextStyle(
                                            color: headingColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      )
                                    : Text(
                                        "Choose the CSV file with correct format.",
                                        style: TextStyle(
                                            color: headingColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: createAllUsers,
                              style: buttonStyle,
                              child: Text(
                                "Upload",
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
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
