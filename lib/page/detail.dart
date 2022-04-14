import 'package:coffeegallery/model/coffee.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final Coffee coffee;

  DetailPage({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(coffee.imageAsset),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                coffee.name,
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                coffee.price
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                coffee.description
              ),
            ),
          ],
        ),
      ),
    );
  }
}