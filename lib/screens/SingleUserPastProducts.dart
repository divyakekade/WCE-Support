import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/Auth%20provider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/SideMenuNavigation.dart';
import 'package:wce_support/screens/SingleProduct.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:wce_support/widgets/Appbar.dart';
import 'package:wce_support/widgets/ContainerWithBlueBorder.dart';

import '../Provider/productProvider.dart';
import '../widgets/errorDialogBox.dart';
import 'HomeScreen.dart';

class SingleUserPastProducts extends StatefulWidget {
  const SingleUserPastProducts({super.key});

  @override
  State<SingleUserPastProducts> createState() => _SingleUserPastProductsState();
}

class _SingleUserPastProductsState extends State<SingleUserPastProducts> {
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
        setState(() {
          isLoading = false;
        });
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
      appBar: const Appbar(),
      // backgroundColor: Color.fromARGB(255, 238, 245, 248),
      body: isLoading
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
                      'Your Products',
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
                                GridB(),
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
    );
  }
}

class GridB extends StatefulWidget {
  GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  var id ;
  @override
  void initState() {
    id  = Provider.of<Auth>(context,listen: false).user_id; 
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> gridMap =
        Provider.of<Prod>(context, listen: false).products;
    return SingleChildScrollView(
      child: gridMap.isEmpty ? ContainerWithBlueBorder(content: "No products are added.", btnText: "Add Product", function: (){
         Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            SideMenuNavigation(loadedPage: 'sell_products')));
      }) : GridView.builder(
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
          return (id!=gridMap[index]['userID'])?SizedBox():InkWell(
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
                //  border: Border.all(width: 0, color: const Color(0x7960c5e1)),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 198, 198, 198),
                      blurRadius: 4,
                      offset: Offset(3.5, 4.5))
                ],
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: const Color(0x7960c5e1),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        gridMap[index]['image'],
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.20,
                        fit: BoxFit.fill,
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
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.001,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: headingColor),
                        borderRadius: BorderRadius.circular(4),
                        color: greyColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rs. ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                          ),
                          Text(
                            gridMap[index]['price'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
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
