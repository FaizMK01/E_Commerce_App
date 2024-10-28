import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../services/firebase_service.dart';
import '../../services/shared_pref.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {


  String? email;

  getSharedPref() async{
    email = await SharedPreferenceHelper().getUserEmail();
    setState(() {

    });
  }


  Stream? allOrder;

  // Load category products
  getOnTheLoad() async {
    await getSharedPref();
    allOrder = FirebaseService().allOrders();
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
        title: Text("All Orders"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: allOrder,
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

                        child: ListTile(
                          leading: ds['ProductImage'] != null
                              ? Image.network(
                            ds['ProductImage'],
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )
                              : null, // Use a placeholder or null if there's no image
                          title:  Text("Name: ${ds['Name'].toString()}"),// Product name
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: ${ds['Email'].toString()}"),

                              Text("Product: ${ds['Product'].toString()}"),
                              Text("Price: ${ds['Price'].toString()}"),

                              Gap(10),



                              GestureDetector(
                                onTap: () async{
                                  await FirebaseService().updateStatus(ds.id);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                    color: AppConstants.primaryColor,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Text("Done",style: TextStyle(
                                    color: AppConstants.whiteColor
                                  ),),
                                ),
                              )
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
