import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale lsit

  final List<Coffee> _shop = [
    //black coffee
    Coffee(name: 'Coffee1', price: '\$3.00', imagePath: 'assets/images/coffee1.png'),
    //lattee
    Coffee(name: 'Coffee2', price: '\$5.00', imagePath: 'assets/images/coffee2.png'),
    // espresso
    Coffee(name: 'Coffee3', price: '\$4.00', imagePath: 'assets/images/coffee3.png'),
    // ice coffee
    Coffee(name: 'Coffee4', price: '\$7.00', imagePath: 'assets/images/coffee4.png'),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    userCart.remove(coffee);
    notifyListeners();
  }
}
