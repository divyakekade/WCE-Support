import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/Provider/productProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SingleUserPastProducts.dart';
import 'package:wce_support/widgets/errorDialogBox.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({super.key});

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  late String productname ='';
  late String description="";
  late int quantity=0;
  late double price=0.0;

  Future<void> addProduct() async {
    print(productname);
    print(description);
    print(quantity);
    print(price);
    try {
      String? id = await Provider.of<Auth>(context, listen: false).user_id;
      await Provider.of<Prod>(context, listen: false)
          .addProduct(productname, description, quantity, price, id);
    } catch (e) {
      showErrorDialogBox2(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
                    'Add Your Product',
                    style: headingTextStyle,
                  ),
                ),
                // Expanded(
                //     child: SingleChildScrollView(
                //   child: 
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
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Enter your product details below",
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.018),
                              )),
                          // const Divider(height: 1, thickness: 2, color: Colors.grey),
                          const Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: width10 * 2,
                          ),
                          TextField(
                            onChanged: (name) {
                              setState(() {
                                productname = name;
                              });
                            },
                            decoration: const InputDecoration(
                                labelText: 'product name',
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
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          TextField(
                            onChanged: (name) {
                              setState(() {
                                description = name;
                              });
                            },
                            minLines: 1,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                labelText: 'product description',
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
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          //password
                          TextField(
                            onChanged: (name) {
                              setState(() {
                                quantity = int.parse(name);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'quantity',
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
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          //password
                          TextField(
                            onChanged: (name) {
                              setState(() {
                                price = double.parse(name);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'price',
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
                            height: width10 * 2,
                          ),
                          //button
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.039,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.014),
                            child: ElevatedButton(
                                onPressed: null,
                                style: secondButtonStyle,
                                child: Text(
                                  "Add Image",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                )),
                          ),
                          SizedBox(
                            height: width10 * 2,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: addProduct,
                              style: buttonStyle,
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.025),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width10 * 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                // )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Divider(height: 1, thickness: 3, color: Colors.grey),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SingleUserPastProducts()));
                    },
                    style: buttonStyle,
                    child: Text(
                      "View Your Past Products",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.021),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
