import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/CreateUser.dart';
import 'package:wce_support/screens/EditProfileManagement.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/UploadUsersData.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class UsersManagement extends StatefulWidget {
  const UsersManagement({super.key});
  static String routeUrl = "./user-management";

  @override
  State<UsersManagement> createState() => _UsersManagementState();
}

class _UsersManagementState extends State<UsersManagement> {
  String username = "";

  Future<void>searchUser()async{
    print(username);
    dynamic user = Provider.of<Auth>(context,listen: false).user;
    try{
     dynamic fuser =  await Provider.of<Auth>(context,listen: false).fetchUserByPrn(username,user['_id']);
    //  print(fuser);
          Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>  EditProfileManagement(user:fuser)));
    }
    catch(error)
    {
      showErrorDialogBox2(error.toString(), context);
    }

  }

  Future<bool> backNavigation() async {
    Navigator.of(context).popAndPushNamed(HomeScreen.routeUrl);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: backNavigation,
        child: Stack(children: [
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
                  'Manage Users',
                  style: headingTextStyle,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                        // vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
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
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UploadUsersData()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.018,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(157, 173, 226, 240),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(2, 3),
                                        blurRadius: 4,
                                        spreadRadius: 1.5,
                                        color: Color.fromARGB(255, 180, 193, 197))
                                  ]),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.upload_file_outlined,
                                    size: 35,
                                    color: Color.fromARGB(255, 70, 120, 126),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      "Upload the data and add multiple users.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.019),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.036,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 6,
                                              color: Color.fromARGB(
                                                  255, 119, 156, 163))
                                        ]),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UploadUsersData()));
                                        },
                                        child: const Icon(
                                          Icons.chevron_right,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.036,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CreateUser()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.018,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(157, 173, 226, 240),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(2, 3),
                                        blurRadius: 4,
                                        spreadRadius: 1.5,
                                        color: Color.fromARGB(255, 180, 193, 197))
                                  ]),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.person_add_outlined,
                                    size: 35,
                                    color: Color.fromARGB(255, 70, 120, 126),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      "Add user deatils and create a user.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.019),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.036,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 6,
                                              color: Color.fromARGB(
                                                  255, 119, 156, 163))
                                        ]),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CreateUser()));
                                        },
                                        child: const Icon(
                                          Icons.chevron_right,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.036,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.018,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(157, 173, 226, 240),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(2, 3),
                                      blurRadius: 4,
                                      spreadRadius: 1.5,
                                      color: Color.fromARGB(255, 180, 193, 197))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.edit_note_outlined,
                                      size: 35,
                                      color: Color.fromARGB(255, 70, 120, 126),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        "Edit user details.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.019),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.74,
                                      child: Text(
                                        "Enter username to edit user deatils",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0165),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                  thickness: 1.5,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.014,
                                ),
                                TextFormField(
                                  onChanged: (name) {
                                    setState(() {
                                      username=name;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        onPressed: searchUser,
                                        style: buttonStyle,
                                        child: const Text("Search user")),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: createUser,
                          //   style: buttonStyle,
                          //   child: Text(
                          //     "Submit",
                          //     style: TextStyle(
                          //         fontSize: MediaQuery.of(context).size.height *
                          //             0.025),
                          //   ),
                          // ),
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
      ),
    );
  }
}
