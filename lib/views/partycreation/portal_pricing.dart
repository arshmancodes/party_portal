import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class PortalPricing extends StatefulWidget {
  const PortalPricing({Key? key}) : super(key: key);

  @override
  _PortalPricingState createState() => _PortalPricingState();
}

class _PortalPricingState extends State<PortalPricing> {
  Widget image_carousel = new Container(
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(10.0)
    // ),
    height: 200.0,
    child: CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
      ),
      items: [1, 2, 3, 4, 5]
          .map((e) => Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: Image.asset('assets/images/EventBidding.png'),
                  );
                },
              ))
          .toList(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event Information',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: image_carousel),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Detail',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
          InkWell(
            onTap: () {
              navigationController.navigateTo(home);
              Get.snackbar("Party Saved", "You have Saved this Party",
                  backgroundColor: Colors.green);
            },
            child: Card(
              elevation: 20,
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: SizedBox(
                width: 100,
                height: 50,
                child: Center(
                  child: Text("3 Portal/ Month FREE"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigationController.navigateTo('/eventDetail');
              Get.snackbar("Party Saved", "You have Saved this Party",
                  backgroundColor: Colors.green);
            },
            child: InkWell(
              onTap: () {
                Get.defaultDialog(
                  textConfirm: "Pay Now",
                  title: "Auction Amount",
                  onConfirm: () {
                    navigationController.navigateTo('/eventDetail');
                    Get.snackbar("Payment Successful",
                        'You have Successfully purchased the access',
                        backgroundColor: Colors.green[300]);
                  },
                  content: Column(
                    children: [
                      Text("Pay Now to get Access"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("The total price will be: 0.99\$"),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                elevation: 20,
                color: Colors.blue[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text("Quick Portal - 0.99\$"),
                  ),
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              navigationController.navigateTo('/eventDetail');
              Get.snackbar("Party Saved", "You have Saved this Party",
                  backgroundColor: Colors.green);
            },
            child: InkWell(
              onTap: () {
                Get.defaultDialog(
                  textConfirm: "Pay Now",
                  title: "Auction Amount",
                  onConfirm: () {
                    navigationController.navigateTo('/eventDetail');
                    Get.snackbar("Payment Successful",
                        'You have Successfully purchased the access',
                        backgroundColor: Colors.green[300]);
                  },
                  content: Column(
                    children: [
                      Text("Pay Now to get Access"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("The total price will be: 4.99\$"),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                elevation: 20,
                color: Colors.blue[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text("Platinum Portal Plan  - 4.99\$/mo"),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              navigationController.navigateTo('/eventDetail');
              Get.snackbar("Party Saved", "You have Saved this Party",
                  backgroundColor: Colors.green);
            },
            child: InkWell(
              onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UsePaypal(
                              sandboxMode: false,
                              clientId:
                              "AabwX5DQfEY_lXWP-iAD0GBTvV37fEeqGAdeEVd7Gye17p0_qpBYJl_Zku9Ykrqh8OzjvPweGRbAqOVC",
                              secretKey:
                              "EMZlCAcVUWPfJgqs46IxudYP4BR9r4oyyvrf5wyPXy-RQ5yBzS_yHBZMKkn92ETWRIuzYL9j4nGmQ1Be",
                              returnURL: "https://samplesite.com/return",
                              cancelURL: "https://samplesite.com/cancel",
                              transactions: const [
                                {
                                  "amount": {
                                    "total": '10.12',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '10.12',
                                      "shipping": '0',
                                      "shipping_discount": 0
                                    }
                                  },
                                  "description":
                                  "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "A demo product",
                                        "quantity": 1,
                                        "price": '10.12',
                                        "currency": "USD"
                                      }
                                    ],

                                    // shipping address is not required though
                                    "shipping_address": {
                                      "recipient_name": "Jane Foster",
                                      "line1": "Travis County",
                                      "line2": "",
                                      "city": "Austin",
                                      "country_code": "US",
                                      "postal_code": "73301",
                                      "phone": "+00000000",
                                      "state": "Texas"
                                    },
                                  }
                                }
                              ],
                              note: "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                print("onSuccess: $params");
                              },
                              onError: (error) {
                                print("onError: $error");
                              },
                              onCancel: (params) {
                                print('cancelled: $params');
                              }),
                        ),
                      ),
              },
              child: Card(
                elevation: 20,
                color: Colors.blue[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text("Payment Check"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
