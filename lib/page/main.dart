import 'package:coffeegallery/common/grid_card.dart';
import 'package:coffeegallery/model/coffee.dart';
import 'package:coffeegallery/page/detail.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Gallery"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return CoffeeList();
        } else if (constraints.maxWidth <= 1200) {
          return CoffeeGrid(gridCount: 4);
        } else {
          return CoffeeGrid(gridCount: 6);
        }
      },)
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
                    child: Image.asset(
                      coffee.imageAsset, 
                      height: 80,
                      fit: BoxFit.cover,
                    )
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

class CoffeeGrid extends StatelessWidget {
  final int gridCount;

  CoffeeGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: MyCoffeeList.map((coffee) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(coffee: coffee);
                }));
              },
              child: CoffeeCardGrid(coffee: coffee)
            );
          }).toList(),
        )
      ),
    );    
  }
}