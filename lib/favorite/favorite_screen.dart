import 'package:flutter/material.dart';
import 'package:provide_tutorials/favorite/myfavourite.dart';
import 'package:provide_tutorials/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // Removed: "List<int> selectedItem = [];"
  // The favourite list now lives in the provider, so it is not needed here.

  @override
  Widget build(BuildContext context) {
    // Removed: "Provider.of<FavouriteItemProvider>(context)"
    // The Consumer below already gives us the provider.
    print('build');

    return Scaffold(
      // ---------- Top blue bar ----------
      appBar: AppBar(
        title: const Text('Favorite App'),
        backgroundColor: Colors.blue,
        actions: [
          // InkWell makes the heart tappable
          InkWell(
            onTap: () {
              // Open the My Favourite screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyfavouriteScreen()),
              );
            },
            // FIX: InkWell needs a child. Without it, it becomes infinitely
            // wide and causes "RenderFlex overflowed by Infinity pixels".
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),

      // ---------- Body ----------
      body: Column(
        children: [
          // Expanded gives the list the remaining screen height
          Expanded(
            child: ListView.builder(
              itemCount: 100, // total rows
              itemBuilder: (context, index) {
                // Consumer rebuilds only this row when the provider changes.
                // "value" is the FavouriteItemProvider object.
                return Consumer<FavouriteItemProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      // Runs when the row is tapped
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index); // already favourite: remove
                        } else {
                          value.addItem(index); // not favourite: add
                        }
                      },

                      // Left side text
                      title: Text('Item ' + index.toString()),

                      // Right side heart icon
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite // filled heart
                            : Icons.favorite_border_outlined, // empty heart
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}