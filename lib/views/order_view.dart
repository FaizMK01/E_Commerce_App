import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/services/shared_pref.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/views/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/firebase_service.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {

  String? email;

  getSharedPref() async{
    email = await SharedPreferenceHelper().getUserEmail();
    setState(() {

    });
  }


  Stream? orderStream;

  // Load category products
  getOnTheLoad() async {
    await getSharedPref();
    orderStream = FirebaseService().orders(email!);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Category Products",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppConstants.whiteColor
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: orderStream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error loading products"));
                  } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                    return Center(child: Text("No products available"));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      return Card(
                        color: AppConstants.primaryColor,

                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30, // Adjust the radius as per your design
                            backgroundImage: ds['ProductImage'] != null
                                ? NetworkImage(
                              ds['ProductImage'],) // Image from network
                                : AssetImage("images/placeholder.png"), // Placeholder image if no product image
                            backgroundColor: Colors.transparent, // Set background to transparent
                          ),
                          title: Text(
                            ds['Product'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppConstants.whiteColor,
                            ),
                          ), // Product name
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price: ${ds['Price'].toString()}",
                                style: TextStyle(
                                  color: AppConstants.whiteColor,
                                ),
                              ),
                              Text(
                                "Status: ${ds['Status'].toString()}",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

                      );
                    },
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
