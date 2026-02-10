import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'summary.dart';
import 'cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteModel(),
      child: const MyApp(),
    ),
  );
}

class FavoriteModel extends ChangeNotifier {
  final Set<int> _favorites = {};
  Set<int> get favorites => _favorites;

  bool isFavorite(int index) => _favorites.contains(index);

  void toggleFavorite(int index) {
    if (_favorites.contains(index)) {
      _favorites.remove(index);
    } else {
      _favorites.add(index);
    }
    notifyListeners();
  }

  void clear() {
    _favorites.clear();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Shopper',
      debugShowCheckedModeBanner: true,
      initialRoute: '/catalog',
      routes: {
        '/catalog': (context) => const CatalogPage(),
        '/cart': (context) => const CartPage(),
        '/summary': (context) => const SummaryPage(),
      },
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(width: 40, height: 40, color: Colors.primaries[index % Colors.primaries.length]),
            title: Text('Item #$index'),
            trailing: Consumer<FavoriteModel>(
              builder: (context, model, child) {
                return TextButton(
                  onPressed: () => model.toggleFavorite(index),
                  child: model.isFavorite(index) ? const Icon(Icons.check) : const Text('ADD'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}