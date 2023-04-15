import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/HeadingAndField.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({super.key,required this.user});
  dynamic user ; 
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const Appbar(),
      body: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.0052,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                decoration: headingBoxDecoration,
                child: Text(
                  "Seller's Profile",
                  style: headingTextStyle,
                ),
              ),
              Container(
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
                          children: [
                            Text(
                              "Contact seller to buy the product",
                              style: TextStyle(
                                  color: headingColor,
                                  fontSize: MediaQuery.of(context).size.height *
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
                         HeadingAndField(
                          heading: "Name: ",
                          field:"${widget.user['firstname']} ${widget.user['lastname']}",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                         HeadingAndField(
                          heading: "Username: ",
                          field: "${widget.user['username']}",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                         HeadingAndField(
                          heading: "Email: ",
                          field: "${widget.user['email']}",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                         HeadingAndField(
                          heading: "Department: ",
                          field: "${widget.user['department']}",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                         HeadingAndField(
                          heading: "Year: ",
                          field: "${widget.user['year']}",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        HeadingAndField(
                          heading: "Mobile No.: ",
                          field: "${widget.user['mobile']}",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}