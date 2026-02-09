import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteModel = context.watch<FavoriteModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Summary')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your purchase!', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            const Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
            
            for (int i = 0; i < 20; i++)
              if (favoriteModel.isFavorite(i)) Text('- Item #$i'),
            
            const SizedBox(height: 40),
            
            // Challenge 3
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}