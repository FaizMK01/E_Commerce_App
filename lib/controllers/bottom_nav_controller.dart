import 'package:e_commerce_app/views/splash_view.dart';
import 'package:get/get.dart';
import '../views/home_view.dart';
import '../views/order_view.dart';
import '../views/profile-VIew.dart';

class BottomNavController extends GetxController{

  RxList pages = [
    HomeView(),
    OrderView(),
    ProfileView(),


  ].obs;

  RxInt currentIndex = 0.obs;



  @override
  void onInit() {
    super.onInit();
    pages;
  }




}