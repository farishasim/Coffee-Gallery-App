class Coffee {
  String name;
  String description;
  String price;
  String imageAsset;
  List<int> similar;

  Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.similar,
  });
}

var MyCoffeeList = [
  Coffee(
    name: "Cappucino", 
    description: "is a coffee-based drink made primarily from espresso and milk. It consists of one-third espresso, one-third heated milk and one-third milk foam and is generally served in a 6 to 8-ounce cup. The cappuccino is considered one of the original espresso drinks representative of Italian espresso cuisine and eventually Italian-American espresso cuisine", 
    price: "Rp30.000", 
    imageAsset: "image/cappucino.jpg",
    similar: [1,2,3]
  ),
  Coffee(
    name: "Cappucino Double Sugar", 
    description: "is a coffee-based drink made primarily from espresso and milk. It consists of one-third espresso, one-third heated milk and one-third milk foam and is generally served in a 6 to 8-ounce cup. The cappuccino is considered one of the original espresso drinks representative of Italian espresso cuisine and eventually Italian-American espresso cuisine", 
    price: "Rp35.000", 
    imageAsset: "image/cappucino_double_sugar.jpg",
    similar: [2,3]
  ),
  Coffee(
    name: "Hot Cappucino", 
    description: "is a coffee-based drink made primarily from espresso and milk. It consists of one-third espresso, one-third heated milk and one-third milk foam and is generally served in a 6 to 8-ounce cup. The cappuccino is considered one of the original espresso drinks representative of Italian espresso cuisine and eventually Italian-American espresso cuisine", 
    price: "Rp28.500", 
    imageAsset: "image/hot-cappuccino.jpg",
    similar: [3,0]
  ),
  Coffee(
    name: "Coffee Jelly", 
    description: "is a coffee-based drink made primarily from espresso and milk. It consists of one-third espresso, one-third heated milk and one-third milk foam and is generally served in a 6 to 8-ounce cup. The cappuccino is considered one of the original espresso drinks representative of Italian espresso cuisine and eventually Italian-American espresso cuisine", 
    price: "Rp22.000", 
    imageAsset: "image/Coffee_Cincau.jpg",
    similar: []
  ),
];