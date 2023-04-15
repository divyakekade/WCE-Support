import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/HeadingAndField.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

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
                        const HeadingAndField(
                          heading: "Name: ",
                          field: "Divya Kekade",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const HeadingAndField(
                          heading: "Username: ",
                          field: "2020BTECS00038",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const HeadingAndField(
                          heading: "Email: ",
                          field: "divya.kekade@walchandsangli.ac.in",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const HeadingAndField(
                          heading: "Department: ",
                          field: "Computer Science & Engineering",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const HeadingAndField(
                          heading: "Year: ",
                          field: "Third Year",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const HeadingAndField(
                          heading: "Mobile No.: ",
                          field: "8626061856",
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