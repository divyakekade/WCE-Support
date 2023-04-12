import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:wce_support/Provider/productProvider.dart';
import 'package:wce_support/constants/ColorsAndStyles.dart';
import 'package:wce_support/screens/DetailPage.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../widgets/errorDialogBox.dart';

class BuyProducts extends StatefulWidget {
  const BuyProducts({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 245, 248),
      body: isLoading?Text("Loading"):LayoutBuilder(
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
            // Expanded(
            //   child: ListView(
            //     children: [
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //       ProductCard(imagename: "mas", productname: "Product Name"),
            //     ],
            //   ),
            // )
            const Divider(height: 1, thickness: 2, color: Colors.grey),
            Expanded(
                child: Container(
                    //  color: Color.fromARGB(255, 238, 245, 248),
                    color: backgroundColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.016,
                          ),
                          const GridB(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.016,
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
      child: GridView.builder(
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
                  builder: (context) => DetailPage(
                      productname: gridMap[index]['name'],
                      price: gridMap[index]['price'].toString(),
                      quantity: gridMap[index]['quantity'].toString(),
                      imageaddress: gridMap[index]['description'],
                      pid: gridMap[index]['_id'])));
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => DetailPage(
              //           productname: "${gridMap.elementAt(index)['title']}",
              //           price: "${gridMap.elementAt(index)['price']}",
              //           quantity: "${gridMap.elementAt(index)['quantity']}",
              //           imageaddress: "${gridMap.elementAt(index)['images']}",
              //         )));
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.001),
              decoration: BoxDecoration(
                //  border: Border.all(width: 0, color: const Color(0x7960c5e1)),
                boxShadow: const [
                  BoxShadow(
                      color: greyColor,
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      offset: Offset(1.0, 1.0))
                ],
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: const Color(0x7960c5e1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Image.network(
                      gridMap[index]['description'],
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gridMap[index]['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                          gridMap[index]['price'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
