import 'dart:io';
import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';


class AddProductController extends GetxController {
  final RxString dropdownValue = "Watch".obs;
  final RxList<String> categoryList = [ "HeadPhone",
    "Laptop",
    "TV",
    "Watch"].obs;

  final pNameController = TextEditingController();
  final pPriceController = TextEditingController();
  final pDetailController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  var pickedImage = Rx<File?>(null);

  // Function to pick image
  pickImage(ImageSource imageSource) async {
    try {
      final photo = await imagePicker.pickImage(source: imageSource);
      if (photo == null) return;

      pickedImage.value = File(photo.path);  // Update reactive variable
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  uploadImage() async {
    if (pickedImage.value != null) {
      try {
        EasyLoading.show(status: "Uploading...");
        String id = randomAlphaNumeric(10);
        UploadTask uploadTask = FirebaseStorage.instance.ref("ProductsImage").child(id).putFile(pickedImage.value!);
        TaskSnapshot taskSnapshot = await uploadTask;
        String url = await taskSnapshot.ref.getDownloadURL();

        Map<String, dynamic> addProduct = {
          "Image": url,
          "ProductName": pNameController.text,
          "ProductPrice":pPriceController.text,
          "ProductDetail":pDetailController.text
        };

        await FirebaseService().addProduct(addProduct, dropdownValue.value).then((_) {
          // Clear input fields after successful product addition
          pNameController.clear();
          pPriceController.clear();
          pDetailController.clear();
          pickedImage.value = null;
          dropdownValue.value = categoryList.first; // Reset dropdown value

          Get.showSnackbar(GetSnackBar(
            title: "Product",
            message: "Added Successfully",
            duration: Duration(seconds: 2),
          ));
        });

      } catch (error) {
        Get.showSnackbar(GetSnackBar(
          title: "Error",
          message: error.toString(),
          duration: Duration(seconds: 2),
        ));
      } finally {
        EasyLoading.dismiss();
      }

    } else {
      EasyLoading.dismiss();
      Get.showSnackbar(GetSnackBar(
        message: "Please select an image",
        duration: Duration(seconds: 2),
      ));
    }
  }
}
