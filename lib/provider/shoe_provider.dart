import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_favorite_provider/models/shoe.dart';

List<Shoe> initialData = List.generate(20, (index) => 
  Shoe(title: 'Tenis $index', price: double.parse((Random().nextInt(100) * index).toString()), image: 'images/tenis.png'));

class ShoeProvider extends ChangeNotifier {
  List<Shoe> shoes= initialData;

  List<Shoe> get getShoes => shoes;

  final List<Shoe> _myFavorite = [];

  List<Shoe> get getMyFavorite => _myFavorite;

  void addMyFavorite(Shoe shoe) {
    _myFavorite.add(shoe);
    notifyListeners();
    }

  void removeMyFavorite(Shoe shoe) {
    _myFavorite.remove(shoe);
    notifyListeners();
    }

  }