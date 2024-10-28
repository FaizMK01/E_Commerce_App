import 'package:e_commerce_app/controllers/admin_controller/add_product_controller.dart';
import 'package:e_commerce_app/views/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/UI_button.dart';

class AddProduct extends StatelessWidget {
   AddProduct({super.key});



  final AddProductController addProductController = Get.put(AddProductController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        leading: IconButton(
          onPressed: () {
            Get.offAll(AdminHome());
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: SingleChildScrollView(
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upload product image section
                Text(
                  "Upload The Product Image",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // CircleAvatar for image upload
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.red, // Placeholder color
                        backgroundImage: addProductController.pickedImage.value != null
                            ? FileImage(addProductController.pickedImage.value!)
                            : null, // Display picked image if available
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt_sharp, color: Colors.black),
                            onPressed: () {
                              Get.dialog(
                                Dialog(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Pick Image From",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt_sharp),
                                        title: Text("Camera"),
                                        onTap: () {
                                          addProductController
                                              .pickImage(ImageSource.camera);
                                          Get.back();
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.photo),
                                        title: Text("Gallery"),
                                        onTap: () {
                                          addProductController
                                              .pickImage(ImageSource.gallery);
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Product Name
                Text(
                  "Product Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: addProductController.pNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Product Name";
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
                SizedBox(height: 20),

                // Product Name
                Text(
                  "Product Price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: addProductController.pPriceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Product Price";
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
                SizedBox(height: 20),

                // Product Name
                Text(
                  "Product Detail",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                TextFormField(
                  controller: addProductController.pDetailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Product Detail";
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Detail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),

                // Product Category
                Text(
                  "Product Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                DropdownButtonFormField<String>(
                  value: addProductController.dropdownValue.toString(),
                  hint: const Text("Select Category"),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  onChanged: (String? newValue) {
                    addProductController.dropdownValue.value = newValue!;
                  },
                  items: addProductController.categoryList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(height: 50),

                // Add Product Button
                UiButton(
                  message: "Add Product",
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      addProductController.uploadImage();
                    }
                  },
                ),
              ],
            )),
          ),
        ),
      ),
    );


  }
}
