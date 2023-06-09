import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/productProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/HomeScreen.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleProduct.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/widgets/ContainerWithBlueBorder.dart';

import '../widgets/errorDialogBox.dart';

class BuyProducts extends StatefulWidget {
  const BuyProducts({super.key});
  static String routeUrl = "./buy-products";

  @override
  State<BuyProducts> createState() => _BuyproductState();
}

class _BuyproductState extends State<BuyProducts> {
  bool isLoading = false;
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });

      Provider.of<Prod>(context).getProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      }).catchError((error) {
        showErrorDialogBox2(error.toString(), context);
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<bool> backNavigation() async {
    Navigator.of(context).popAndPushNamed(HomeScreen.routeUrl);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: backNavigation,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(
                builder: (BuildContext context, BoxConstraints contraints) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.012),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.0052,
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      decoration: headingBoxDecoration,
                      child: Text(
                        'Pick Up Your Choice',
                        style: headingTextStyle,
                      ),
                    ),
                    const Divider(height: 1, thickness: 2, color: Colors.grey),
                    Expanded(
                        child: Container(
                            //  color: Color.fromARGB(255, 238, 245, 248),
                            color: backgroundColor,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.016,
                                  ),
                                  const GridB(),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.016,
                                  ),
                                ],
                              ),
                            ))),
                  ],
                );
              }),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> gridMap =
        Provider.of<Prod>(context, listen: false).products;
    print(gridMap);
    return SingleChildScrollView(
      child: gridMap.isEmpty
          ? ContainerWithBlueBorder(
              content: "No products here.",
              btnText: "Add Product",
              function: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SideMenuNavigation(loadedPage: 'sell_products')));
              })
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: MediaQuery.of(context).size.width * 0.02 ,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.015,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.30,
              ),
              itemCount: gridMap.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SingleProductPage(product: gridMap[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.001),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.033,
                      vertical: MediaQuery.of(context).size.height * 0.015,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: headingColor),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 198, 198, 198),
                            blurRadius: 4,
                            offset: Offset(3, 4))
                      ],
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      // color: const Color.fromARGB(255, 219, 220, 220),
                      color: const Color.fromARGB(255, 228, 229, 230),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                6.0,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 198, 198, 198),
                                    blurRadius: 4,
                                    offset: Offset(3, 4))
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                gridMap[index]['image'],
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width:
                                    MediaQuery.of(context).size.height * 0.20,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Center(
                            child: Text(
                              gridMap[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: headingColor),
                              borderRadius: BorderRadius.circular(50),
                              color: imagebutton,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rs. ",
                                  style: TextStyle(
                                      color: headingColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018),
                                ),
                                Text(
                                  gridMap[index]['price'].toString(),
                                  style: TextStyle(
                                      color: headingColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
