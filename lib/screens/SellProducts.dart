import 'package:flutter/material.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SingleUserPastProducts.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({super.key});

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  late String productname;
  late int quantity;
  late double price;

  final _productnameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _productdescriptionController = TextEditingController();

  @override
  void dispose() {
    _productnameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width * 0.025;
    double heightc = MediaQuery.of(context).size.width * 0.053;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
                  'Add You Product',
                  style: headingTextStyle,
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
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
                          controller: _productnameController,
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
                          controller: _productdescriptionController,
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
                          controller: _quantityController,
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
                          controller: _priceController,
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
                            onPressed: null,
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
              )),
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
          )
        ],
      ),
    );
  }
}
