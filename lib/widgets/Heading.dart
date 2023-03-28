import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
class Heading extends  StatelessWidget implements PreferredSizeWidget {
  const Heading(
      {Key? key,
        required this.HeadingText,
      })
      : super(key: key);

  final String HeadingText;

  Widget build(BuildContext context) {

    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    double width = MediaQuery.of(context).size.width*0.38;
     return  Container(
       margin: EdgeInsets.all(heightc),
       width: width*2,
       height: heightc*2.3,
       padding: EdgeInsets.symmetric(vertical: heightc/2, horizontal: width10*5),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         boxShadow: [
           BoxShadow(
             blurRadius: 5,
             color: grey_color,
           ),
           BoxShadow(
             offset: Offset(5, 2),
             blurRadius: 5,
             spreadRadius: 2,
             color: Colors.black38,
             inset: true,
           ),
         ],
       ),
       child: Center(
         child: Text(
           HeadingText,
           style: TextStyle(
             fontSize: heightc,
             fontWeight: FontWeight.bold,
             color: heading_color,
           ),

         ),
       ),
     );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}