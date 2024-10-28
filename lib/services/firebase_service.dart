import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{

  //User Login
  Future addUser(Map<String,dynamic> userInfo,String id) async{
    await FirebaseFirestore.instance.collection("Users").doc(id).set(userInfo);

  }

 //AdminLogin
  Future adminLogin(Map<String,dynamic> userInfo,String id) async{
    await FirebaseFirestore.instance.collection("Admin").doc(id).set(userInfo);

  }

  Future addProduct(Map<String,dynamic> userInfo,String categoryName) async{
    await FirebaseFirestore.instance.collection(categoryName).add(userInfo);

  }


  Stream<QuerySnapshot> getCategoriesProducts(String categoryName) {
    return FirebaseFirestore.instance.collection(categoryName).snapshots();
  }

  Stream<QuerySnapshot> orders(String email) {
    return FirebaseFirestore.instance.collection("Orders").where("Email",isEqualTo: email).snapshots();
  }


  Stream<QuerySnapshot> allOrders() {
    return FirebaseFirestore.instance.collection("Orders").where("Status",isEqualTo: "On The Way").snapshots();
  }





//order

  Future orderDetails(Map<String,dynamic> userInfo) async{
    await FirebaseFirestore.instance.
    collection("Orders").
    add(userInfo);

  }



   updateStatus(String id) async{
    await FirebaseFirestore.instance.collection("Orders").doc(id)..update({
      "Status":"Delivered"
    });

  }




}