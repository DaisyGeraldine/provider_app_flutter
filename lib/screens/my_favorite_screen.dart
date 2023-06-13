import 'package:flutter/material.dart';
import 'package:my_favorite_provider/models/shoe.dart';
import 'package:my_favorite_provider/provider/shoe_provider.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:badges/badges.dart' as badges;


class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({super.key});

  @override
  State<MyFavoriteScreen> createState() => MyFavoriteScreenState();
}

class MyFavoriteScreenState extends State<MyFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var myfavorite = context.watch<ShoeProvider>().getMyFavorite;
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: const Text('Mis favoritos', style: TextStyle(color: Colors.white),),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10), 
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            ),
          itemCount: myfavorite.length,  
          itemBuilder: ((context, index) {
            Shoe shoe = myfavorite[index];
            return Card(
              key: ObjectKey(shoe),
              color: Colors.white,
              elevation: 1,
              child: Column(children: [
                Expanded(
                  child: Image.asset(shoe.image!, width: 100, height: 100,),
                ),
                Text(shoe.title!),
                Text(shoe.price.toString()),
                IconButton(
                  onPressed: () {
                    context.read<ShoeProvider>().removeMyFavorite(shoe);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red,),
                ),
              ],),
            );
          }),
        ),
      ),
    );
  }
}