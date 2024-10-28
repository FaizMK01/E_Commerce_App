import 'package:e_commerce_app/controllers/admin_controller/add_product_controller.dart';
import 'package:e_commerce_app/services/auth.dart';
import 'package:e_commerce_app/views/splash_view.dart';
import 'package:e_commerce_app/widgets/profile_view_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../services/shared_pref.dart';
import '../utils/app_constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? email, name;

  getSharedPref() async {
    email = await SharedPreferenceHelper().getUserEmail();
    name = await SharedPreferenceHelper().getUserName();

    setState(() {});
  }

  getOnTheLoad() async {
    await getSharedPref();
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
          "Profile",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppConstants.whiteColor
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.black,
      ),
      body: name==null || email == null?Center(
        child: CircularProgressIndicator(),
      ):Padding(
        padding:  EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // Add any padding or margin if needed
                child: ClipOval(
                  child: Image.asset(
                    "images/profilelogo.jpg",
                    width: 200, // Diameter of the circle
                    height: 200, // Diameter of the circle
                    fit: BoxFit.cover, // Cover the entire Circle
                  ),
                ),
              ),
               Gap(30),
              ProfileViewHelper(leadIcon: Icons.person,
                  title: "Name ",
                  subtitle: name! ?? "UserName"),
              Gap(10),
              ProfileViewHelper(leadIcon: Icons.mail,
                  title: "Email ",
                  subtitle: email! ?? "UserEmail"),
              Gap(10),
              GestureDetector(
                onTap: (){
                  AuthMethods().signOut();
                  Get.offAll(SplashView());

                },
                child: ProfileViewHelper(leadIcon: Icons.logout,
                    title: "Logout",
                    subtitle: "Logout"),
              ),
              Gap(10),
              GestureDetector(
                onTap: (){
                  AuthMethods().deleteUser().then((v){
                    Get.offAll(SplashView());
                  });
                },
                child: ProfileViewHelper(leadIcon: Icons.delete,
                    title: "Delete Account",
                    subtitle: "Delete"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
