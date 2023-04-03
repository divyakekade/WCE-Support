import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../constants/ColorsAndStyles.dart';

class HeadingAndField extends StatelessWidget {
  const HeadingAndField(
      {super.key, required this.heading, required this.field});
  final String heading;
  final String field;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black, width: 0.5),
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            child: Row(
              children: [
                Text(
                  heading,
                  style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.height * 0.019),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.002,
                  horizontal: MediaQuery.of(context).size.width * 0.001),
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.008,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(174, 174, 174, 1),
                      offset: Offset(1, 2),
                      blurRadius: 2,
                      inset: true)
                ],
              ),
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //       heading,
                  //       style: TextStyle(
                  //           // decoration: TextDecoration.underline,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: MediaQuery.of(context).size.height * 0.019),
                  // ),
                  //     ],
                  //   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        field,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
