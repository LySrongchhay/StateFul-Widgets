import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(isFavorite: true),
          FavoriteCard(isFavorite: false),
          FavoriteCard(isFavorite: true),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key, required this.isFavorite});
  final bool isFavorite;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool _isFavorite = widget.isFavorite;


  void toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  Icon displayFavorite() {
    if (!_isFavorite) {
      return favoriteOutline;
    }
    return favorite;
  }

  Icon get favorite => Icon(Icons.favorite, color: Colors.red);

  Icon get favoriteOutline => Icon(Icons.favorite_outline);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "title",
                  style: TextStyle(color: Colors.blue[800], fontSize: 18),
                ),
                Text("description", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          IconButton(onPressed: toggleFavorite, icon: displayFavorite()),
        ],
      ),
    );
  }
}
