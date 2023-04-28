import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ContainerWithBlueBorder extends StatefulWidget {
  const ContainerWithBlueBorder(
      {Key? key, required this.content, required this.btnText, required this.function})
      : super(key: key);
  final String content;
  final Function() function;
  final String btnText;
  @override
  State<ContainerWithBlueBorder> createState() =>
      _ContainerWithBluwBorderState();
}

class _ContainerWithBluwBorderState extends State<ContainerWithBlueBorder> {
  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.06),
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.016,
          horizontal: MediaQuery.of(context).size.width * 0.009),
      decoration: BoxDecoration(
        color: const Color(0x9d47b6d2),
        border:
            Border.all(color: const Color.fromARGB(255, 7, 65, 79), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10 * 0.001),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: heightc / 2, horizontal: width10 * 2),
                margin: EdgeInsets.symmetric(horizontal: width10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 246, 246),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.content,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.0195,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: width10 * 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: widget.function,
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  widget.btnText,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: heightc * 0.8),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
