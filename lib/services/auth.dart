import 'package:e_commerce_app/controllers/admin_controller/add_product_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signOut() async{
    await auth.signOut();
  }

  Future deleteUser() async{
    User? user = auth.currentUser;
    user?.delete();
  }







}