import 'dart:ffi';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../constants/ColorsAndStyles.dart';

class PutGrievance extends StatefulWidget {
  const PutGrievance({super.key});

  @override
  State<PutGrievance> createState() => _PutGrievanceState();
}

class _PutGrievanceState extends State<PutGrievance> {
  String subject = "";
  String selectedOption = "One";
  List<String> sectionList = <String>['One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.013,
                vertical: MediaQuery.of(context).size.height * 0.01),
              padding:  EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.038,
                 vertical: MediaQuery.of(context).size.height * 0.008),
              decoration: BoxDecoration(
                  color: card_background,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 159, 157, 157),
                        offset: Offset(2, 4),
                        blurRadius: 4)
                  ]),
              child: Text(
                "Put Your Grievance",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.028,
                    fontWeight: FontWeight.w500,
                    color: heading_color),
              ),
            ),
            Container(
              margin:  EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.039, 
                vertical: MediaQuery.of(context).size.height * 0.014),
              child: TextFormField(
                onChanged: (sub) {
                  setState(() {
                    subject = sub;
                  });
                  print(subject);
                },
                decoration: const InputDecoration(
                    // contentPadding: EdgeInsets.all(4),
                    labelText: "subject",
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(color: Colors.black, width: 0.3)),
                    focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black, width: 0.3))),
              ),
            ),
            Container(
              margin:  EdgeInsets.symmetric(
                
                horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height * 0.014
              ),
              child: SizedBox(
                  child: TextFormField(
                minLines: 1,
                maxLines: 10, // allow user to enter 5 line in textfield
                keyboardType: TextInputType.multiline,
                onChanged: (sub) {
                  setState(() {
                    subject = sub;
                  });
                  print(subject);
                },
    
                decoration: const InputDecoration(
                    // contentPadding: EdgeInsets.all(4),
                    labelText: "write your grievence here",
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(color: Colors.black, width: 0.3)),
                    focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.black, width: 0.3))),
              )),
            ),
            Container(
              margin:  EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height *0.008        
                       ),
              child:  Align(
                alignment: Alignment.topLeft,
                child: Text('Add image as a proof if any',
                    style: TextStyle(color: heading_color, fontSize: MediaQuery.of(context).size.height*0.018)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height * 0.014              ),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(ui.Size(150, 45)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(imagebutton),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      child:  Text(
                        "Add Image",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05),
                      ))),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height * 0.005   ),
              child:  Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose department for your grievance',
                  style: TextStyle(color: heading_color, 
                  fontSize: MediaQuery.of(context).size.height * 0.018),
                ),
              ),
            ),
            Container(
                // width: 300,
                margin: EdgeInsets.symmetric(
                     horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height * 0.018),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.all(4),
    
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.3)),
                      focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.3))),
                  items: sectionList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.035,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(ui.Size(130, 40)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
    
                 horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height * 0.014
              ),
              child:  Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Past Grievances',
                  style: TextStyle(
                      color: heading_color,
                      fontSize: MediaQuery.of(context).size.width*0.05,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const Divider(height: 1, thickness: 2, color: Colors.grey),
            Container(
              margin: EdgeInsets.symmetric(
                 horizontal: MediaQuery.of(context).size.width * 0.039,
                  vertical: MediaQuery.of(context).size.height * 0.018
                ),
              padding: EdgeInsets.symmetric(
                 horizontal: MediaQuery.of(context).size.width * 0.035,
                  vertical: MediaQuery.of(context).size.height * 0.009
              ),
              decoration: const BoxDecoration(
                            color: cardColor,
    
                boxShadow:[
                   BoxShadow(
                    color: Color.fromRGBO(159,157,157,1),
                  offset: Offset(2, 4),
                  blurRadius: 4
                )
                ]
              ),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "subject:-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.023
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Description:-",
                      style: TextStyle(
                       fontSize: MediaQuery.of(context).size.height * 0.017
    
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            )
                        ),
                      
                        child: Text("Give Feedback"))
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
