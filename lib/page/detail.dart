import 'package:coffeegallery/common/grid_card.dart';
import 'package:coffeegallery/model/coffee.dart';
import 'package:flutter/material.dart';

import '../common/favorite_button.dart';

class DetailPage extends StatelessWidget {

  final Coffee coffee;

  DetailPage({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: Image.asset(coffee.imageAsset)
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                    ],
                  )
                )
              ]
            ),
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
              padding: EdgeInsets.only(
                left: 15, right: 15, top: 15
              ),
              child: Text(
                coffee.description
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15, right: 15,
              ),
              child: SimilarCoffeeList(coffee: coffee),
            )
          ],
        ),
      ),
    );
  }
}

class SimilarCoffeeList extends StatelessWidget{
  final Coffee coffee;

  SimilarCoffeeList({required this.coffee});
  
  @override
  Widget build(BuildContext context) {
    if (coffee.similar.length > 0) {
      return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Similar Drinks",
                style: TextStyle(fontSize: 17),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: this.coffee.similar.map((similarIdx) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailPage(coffee: MyCoffeeList[similarIdx]);
                    }));
                  },
                  child: CoffeeCardGrid(coffee: MyCoffeeList[similarIdx]),
                );
              }).toList(),
            )
          ],
        ),
      );
    }
    return Container();
  }
}