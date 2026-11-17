import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it add been successfully added
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text('Successfully added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'How would you like your coffee?',
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: backgroundColor,
        drawer: Drawer(
          backgroundColor: backgroundColor,
          child: Column(
            children: [
               DrawerHeader(
                child: Image.asset(
                  'assets/images/intro_coffee.png',
                  width: 300,
                  height: 300,
                )
              ),
              SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                ),
              )
            ],
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              //list of coffee to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    // get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    //return the tile of coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: Icon(Icons.add),
                      onPressed: () => addToCart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
