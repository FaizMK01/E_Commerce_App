import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(right: 10,left: 10),
      //padding: EdgeInsets.,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            width: 200,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900, // Darker shade for better contrast
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4), // Shadow effect
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/headphone.PNG",
                    height: 200, // Adjusted height for a better fit
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Headphone",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // Improved text visibility
                    ),
                  ),
                ),
                const SizedBox(height: 4), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between price and button
                    children: [
                      Text(
                        "\$100",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Slightly increased font size for clarity
                          color: Colors.teal,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8), // Padding inside the button
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,

                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white, // Icon color for visibility
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900, // Darker shade for better contrast
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4), // Shadow effect
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/f.webp",
                    height: 200, // Adjusted height for a better fit
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Watch",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // Improved text visibility
                    ),
                  ),
                ),
                const SizedBox(height: 4), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between price and button
                    children: [
                      Text(
                        "\$200",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Slightly increased font size for clarity
                          color: Colors.teal,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8), // Padding inside the button
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white, // Icon color for visibility
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900, // Darker shade for better contrast
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4), // Shadow effect
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/key.jpg",
                    height: 200, // Adjusted height for a better fit
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Keyboard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // Improved text visibility
                    ),
                  ),
                ),
                const SizedBox(height: 4), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between price and button
                    children: [
                      Text(
                        "\$2300",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Slightly increased font size for clarity
                          color: Colors.teal,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8), // Padding inside the button
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,

                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white, // Icon color for visibility
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900, // Darker shade for better contrast
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4), // Shadow effect
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/table.jpeg",
                    height: 200, // Adjusted height for a better fit
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "CPU Sysytem",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // Improved text visibility
                    ),
                  ),
                ),
                const SizedBox(height: 4), // Added spacing
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between price and button
                    children: [
                      Text(
                        "\$2300",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Slightly increased font size for clarity
                          color: Colors.teal,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8), // Padding inside the button
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white, // Icon color for visibility
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),




        ],
      ),
    );
  }
}
