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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor
          ),
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
                'Your Grievances',
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
                      return (list[index]['userID']==user["_id"])
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
                                    vertical:
                                        MediaQuery.of(context).size.height * 0.008,
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.035),
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.02,
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    bottom: MediaQuery.of(context).size.height * 0.01),
                                decoration: BoxDecoration(
                                  // color: cardColor,
                                  color: const Color.fromARGB(255, 228, 229, 230),
                                  border: Border.all(
                                            color: headingColor, width: 0.5),
                                  boxShadow: const [
                                    BoxShadow(
                                    color: Color.fromRGBO(194, 194, 194, 1),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.78,
                                              child: Text(
                                                list[index]['subject'],
                                                style: TextStyle(
                                                  color: const Color.fromARGB(255, 15, 100, 112),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.02),
                                              )),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.78,
                                            child: Text(
                                              list[index]['description'],
                                              maxLines: 2,
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.018),
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.022,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(0.0),
                                          decoration: BoxDecoration(
                                              color: imagebutton,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(MaterialPageRoute(
                                                                builder: (context) =>
                                                                    SingleGrievance(grievance:list[index])));
                                              },
                                              child: const Icon(
                                                Icons.chevron_right,
                                                size: 32,
                                                color: headingColor,
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height: MediaQuery.of(context).size.width *
                                            0.03),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width *
                                              0.02),
                                      width: MediaQuery.of(context).size.width * 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(list[index]['date'],style: TextStyle(color: headingColor,fontSize: MediaQuery.of(context).size.height*0.014),),
                                          Text(list[index]['time'],style: TextStyle(color: headingColor,fontSize: MediaQuery.of(context).size.height*0.014),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      )
                      :Container();
                    }))
            // ),
          ],
        ),]
      ),
    );
  }
}
