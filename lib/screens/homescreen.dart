import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_favorite_provider/provider/shoe_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../models/shoe.dart';
import 'my_favorite_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var myfavorite = context.watch<ShoeProvider>().getMyFavorite;
    var shoes = context.watch<ShoeProvider>().getShoes;
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: const Text('Productos', style: TextStyle(color: Colors.white),),
          actions: [
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 5, end: 5),
              badgeContent: Text(myfavorite.length.toString(), style: TextStyle(color: Colors.white),),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavoriteScreen()));
                  },
                  icon: const Icon(Icons.bookmark, color: Colors.white,),
                ),
            ),
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.all(10), 
        child: ListView.builder(
          itemCount: shoes.length,  
          itemBuilder: ((context, index) {
            Shoe shoe = shoes[index];
            return Card(
              key: ObjectKey(shoe),
              color: Colors.white,
              elevation: 1,
              child: ListTile(
                contentPadding: const EdgeInsets.all(4),
                leading: Image.asset(shoe.image!, width: 100, height: 100,),
                title: Text(shoe.title!),
                trailing: IconButton(
                  onPressed: () {
                    if (myfavorite.contains(shoe)) {
                      context.read<ShoeProvider>().removeMyFavorite(shoe);
                    } else {
                      context.read<ShoeProvider>().addMyFavorite(shoe);
                    }
                  },
                  icon: Icon(
                    Icons.bookmark, 
                    color: myfavorite.contains(shoe) ?
                    Colors.redAccent: Colors.grey,
                  ),
                ),
                subtitle: Text('\$${shoe.price}'),
                
              ),
            );
          }),
        ),
      ),
    );
  }
}