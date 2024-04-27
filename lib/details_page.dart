// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  // final String title;
  // final String photographer;
  // final String price;
  // final String details;
  final int index;
  DetailsPage(
      {super.key,
      required this.imagePath,
      // required this.title,
      // required this.photographer,
      // required this.price,
      // required this.details,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(30),
                    //     bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // ignore: sized_box_for_whitespace
          ],
        ),
      ),
    );
  }
}
