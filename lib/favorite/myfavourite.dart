import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class MyfavouriteScreen extends StatefulWidget {
  const MyfavouriteScreen({super.key});

  @override
  State<MyfavouriteScreen> createState() => _MyfavouriteScreenState();
}

class _MyfavouriteScreenState extends State<MyfavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      // ---------- Top blue bar ----------
      // Removed the InkWell: this screen does not need to open itself again.
      // The back arrow is added automatically by Flutter.
      appBar: AppBar(
        title: const Text('My Favourite'),
        backgroundColor: Colors.blue,
      ),

      // ---------- Body ----------
      body: Column(
        children: [
          Expanded(
            // Consumer gives us the provider as "value"
            child: Consumer<FavouriteItemProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  // Only as many rows as there are favourite items
                  itemCount: value.selectedItem.length,
                  itemBuilder: (context, index) {
                    // The real item number stored in the list.
                    // Example: list is [0, 5, 7], row 1 shows item 5.
                    final itemNumber = value.selectedItem[index];

                    return ListTile(
                      // Tap the row to remove it from favourites
                      onTap: () {
                        value.removeItem(itemNumber);
                      },

                      // Left side text
                      title: Text('Item ' + itemNumber.toString()),

                      // Right side filled heart (all items here are favourites)
                      trailing: const Icon(Icons.favorite),
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