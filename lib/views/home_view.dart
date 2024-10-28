import 'package:e_commerce_app/services/shared_pref.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/widgets/productsTile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/categoryTile.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List categories = [
    "images/headphone2.png",
    "images/laptop.png",
    "images/TV.png",
    "images/watch.png",
    "images/kitchen.png",
    "images/cpo.jpeg",
  ];

  final List categoryName = [
    "HeadPhone",
    "Laptop",
    "TV",
    "Watch",
    "Kitchen",
    "CPU"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(right: 10, left: 10, top: 40),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Hey, Faiz MK",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Good Morning",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                  color: Colors.blueGrey
                ),

              )
            ]),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  height: 60, width: 60, fit: BoxFit.cover, 'images/profilelogo.jpg'),
            ),
          ],
        ),
        Gap(30),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Search Product",
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))),
          ),
        ),
        Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        Gap(20),
        Row(
          children: [
            // Categories ListView
            Expanded(
              child: Container(
                height: 120,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      image: categories[index],
                      name: categoryName[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        Gap(10),
        ProductsTile()
      ]),
    ));
  }
}
