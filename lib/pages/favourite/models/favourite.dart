import 'package:fruits_app_bloc/models/fruit.dart';

class FavouriteModel {
  const FavouriteModel({this.items = const <Fruit>[]});

  final List<Fruit> items;
}
