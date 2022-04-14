import 'package:coffeegallery/model/coffee.dart';
import 'package:coffeegallery/page/detail.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeri Kopi"),
      ),
      body: CoffeeList(),
    );
  }
}

class CoffeeList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: MyCoffeeList.length,
      itemBuilder: (context, index) {
        final Coffee coffee = MyCoffeeList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(coffee: coffee);
            }));
          },
          child: Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(coffee.imageAsset, 
                    height: 80,
                    fit: BoxFit.cover,)
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            coffee.name
                          ),
                          Text(
                            coffee.price
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
        );
      }
    );
  }
}