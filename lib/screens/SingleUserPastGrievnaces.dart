import 'dart:io';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/grievancesProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SingleGrievance.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class SingleUserPastGrievances extends StatefulWidget {
  const SingleUserPastGrievances({super.key});

  @override
  State<SingleUserPastGrievances> createState() =>
      _SingleUserPastGrievancesState();
}

class _SingleUserPastGrievancesState extends State<SingleUserPastGrievances> {
  bool _isInit = false;
  dynamic user ; 
  List list = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten"
  ];
  void initState(){
    user = Provider.of<Auth>(context,listen: false).user; 

  }
   void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        // isLoading = true;
      });

      Provider.of<Griv>(context).viewGrievances().then((_) {
        setState(() {
          // isLoading = false;
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
      appBar: Appbar(),
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
              'Your Past Grievances',
              style: headingTextStyle,
            ),
          ),
          Expanded(
              // child: SingleChildScrollView(
              // child: Container(
              //     height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    dynamic l = list[index];
                    return (list[index]['userID']==user["_id"])?Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.03),
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              child: Text(
                                "Subject of the grievance",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )),
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03),
                          Text(
                            list[index]['subject'],
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.017),
                          ),
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
                                            0.018),
                              ),
                              Text(
                                list[index]['status'],
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: ()=>{
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
                        ],
                      ),
                    ):Container();
                  }))
          // ),
        ],
      ),
    );
  }
}
