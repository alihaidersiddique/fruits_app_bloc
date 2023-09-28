import 'package:fruits_app_bloc/models/fruit.dart';

const _delay = Duration(seconds: 1);

final fruits = [
  Fruit(id: 1, name: "Apple", price: "200"),
  Fruit(id: 2, name: "Banana", price: "100"),
  Fruit(id: 3, name: "Orange", price: "150"),
  Fruit(id: 4, name: "Mango", price: "250"),
  Fruit(id: 5, name: "Strawberry", price: "300"),
  Fruit(id: 6, name: "Pineapple", price: "200"),
  Fruit(id: 7, name: "Watermelon", price: "100"),
  Fruit(id: 8, name: "Grapes", price: "150"),
  Fruit(id: 9, name: "Papaya", price: "250"),
  Fruit(id: 10, name: "Guava", price: "300"),
  Fruit(id: 11, name: "Cherry", price: "200"),
  Fruit(id: 12, name: "Peach", price: "100"),
  Fruit(id: 13, name: "Pear", price: "150"),
  Fruit(id: 14, name: "Lychee", price: "250"),
  Fruit(id: 15, name: "Apricot", price: "300"),
  Fruit(id: 16, name: "Avocado", price: "200"),
  Fruit(id: 17, name: "Blackberry", price: "100"),
  Fruit(id: 18, name: "Blueberry", price: "150"),
  Fruit(id: 19, name: "Cantaloupe", price: "250"),
  Fruit(id: 20, name: "Cranberry", price: "300"),
];

class AppRepository {
  final _favourites = <Fruit>[];

  Future<List<Fruit>> loadFruits() async =>
      Future.delayed(_delay, () => fruits);

  Future<List<Fruit>> loadFavourites() async =>
      Future.delayed(_delay, () => _favourites);

  void addToFavourite(Fruit fruit) => _favourites.add(fruit);

  void removeFromFavourite(Fruit fruit) => _favourites.remove(fruit);
}
