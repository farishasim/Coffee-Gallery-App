import 'package:coffeegallery/common/grid_card.dart';
import 'package:coffeegallery/model/coffee.dart';
import 'package:flutter/material.dart';

import '../common/favorite_button.dart';

class DetailPage extends StatelessWidget {

  final Coffee coffee;

  DetailPage({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(coffee: coffee);
      } else {
        return DetailMobilePage(coffee: coffee);
      }
    }));
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

class DetailMobilePage extends StatelessWidget {
  final Coffee coffee;

  DetailMobilePage({required this.coffee});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

class DetailWebPage extends StatelessWidget {
  final Coffee coffee;

  DetailWebPage({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Gallery"),
      ),
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset(
                coffee.imageAsset,
                fit: BoxFit.cover
              )
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      coffee.name,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      coffee.price,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      coffee.description,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}