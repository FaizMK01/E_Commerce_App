import 'dart:convert';

import 'package:e_commerce_app/services/shared_pref.dart';
import 'package:e_commerce_app/services/stripe_service.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/views/curved_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../services/firebase_service.dart';

class ProductDetailView extends StatefulWidget {
  final String image ,name, price, detail;
  const ProductDetailView({super.key,required this.image,required this.name,required this.price,required this.detail});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {

  Map<String , dynamic>? paymentIntent;

  String? name, mail;

  getSharePref() async{
    name = await SharedPreferenceHelper().getUserName();
    mail = await SharedPreferenceHelper().getUserEmail();

    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    getSharePref();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () {

            Get.back();

          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.image),
              Gap(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.price, // Ensure price is sanitized before display
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFFE07A5F), // Accent color for the price
                          ),
                        ),
                      ],
                    ),
                    Gap(30),
                    Text(
                      "Details",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Gap(10),
                    Text(widget.detail),
                    Gap(70),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Check if price is valid before making payment
                            if (widget.price != null && widget.price.isNotEmpty) {
                              // Sanitize the price if needed
                              String sanitizedPrice = widget.price.replaceAll(RegExp(r'[^\d.]'), '');

                              try {
                                // Call makePayment with sanitized price
                                await makePayment(sanitizedPrice);
                                // Show a success message or redirect user if needed
                              } catch (e) {
                                // Handle any errors in the payment process
                                print("Payment failed: $e");
                                Get.showSnackbar(GetSnackBar(
                                  title: "Payment Error",
                                  message: e.toString(),
                                ));
                              }
                            } else {
                              // Show an error if price is not valid
                              Get.showSnackbar(GetSnackBar(
                                title: "Error",
                                message: "Price is invalid or missing.",
                              ));
                            }
                          },
                          child: Text("Buy Now"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.primaryColor,
                            foregroundColor: AppConstants.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }



  Future<void> makePayment(String amount) async {
    try {
      // Step 1: Create a Payment Intent
      paymentIntent = await createPaymentIntent(amount, 'USD');

      // Step 2: Initialize the Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Your Merchant Name',
        ),
      )
          .then((_) {
        // Step 3: Display the Payment Sheet
        displayPaymentSheet();
      });
    } catch (e, s) {
      // Debugging logs
      print("Error in makePayment: $e\nStackTrace: $s");
      // Show an error snackbar
      Get.showSnackbar(GetSnackBar(
        title: "Payment Error",
        message: "Failed to initiate payment",
        duration: Duration(seconds: 3),
      ));
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((_) {
        Map<String,dynamic> orderInfoMap = {
          "Product":widget.name,
          "Price":widget.price,
          "ProductImage":widget.image,
          "Name":name,
          "Email": mail,
          "Status":"On The Way"
        };

        FirebaseService().orderDetails(orderInfoMap);



        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.check, color: Colors.greenAccent),
                    Text("Payment Successful"),
                  ],
                ),
              ],
            ),
          ),
        );
        paymentIntent = null; // Clear the payment intent after success
      }).onError((error, stackTrace) {
        print("Error during payment sheet presentation: $error\n$stackTrace");
      });
    } on StripeException catch (e) {
      // Handle Stripe-specific exceptions
      print("StripeException: ${e.toString()}");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text("Payment cancelled"),
        ),
      );
    } catch (e) {
      print("General error in displayPaymentSheet: ${e.toString()}");
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'), // Correct Stripe endpoint
        headers: {
          'Authorization': 'Bearer $secretKey', // Replace with your actual Stripe Secret Key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      // Log the response for debugging
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      // Check for errors in the response
      if (response.statusCode != 200) {
        throw Exception('Failed to create payment intent. Status code: ${response.statusCode}');
      }

      return jsonDecode(response.body); // Parse the response body
    } catch (e) {
      print("Error in createPaymentIntent: ${e.toString()}");
      throw Exception('Failed to create payment intent');
    }
  }


  String calculateAmount(String amount) {

    String sanitizedAmount = amount.replaceAll(RegExp(r'[^\d.]'), '');
    final calculatedAmount = (double.parse(sanitizedAmount) * 100).toInt(); // Convert to cents
    return calculatedAmount.toString();
  }



}
