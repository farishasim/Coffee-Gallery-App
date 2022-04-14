import 'package:coffeegallery/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeCardGrid extends StatelessWidget {
  final Coffee coffee;

  CoffeeCardGrid({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset(
                coffee.imageAsset,
                height: 600,
                fit: BoxFit.fitHeight,
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(coffee.name, textAlign: TextAlign.center,),
                  Text(coffee.price)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}