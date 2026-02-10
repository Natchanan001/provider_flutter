import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteModel = context.watch<FavoriteModel>();

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                if (favoriteModel.isFavorite(index)) {
                  return ListTile(
                    leading: const Icon(Icons.done, color: Colors.black),
                    title: Text('Item #$index'),
                    // --- ✨ เพิ่มปุ่มลบตรงนี้ค่ะคุณพี่ ---
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.black),
                      onPressed: () {
                        // เรียกฟังก์ชันเดิมที่คุณพี่มีเพื่อเอาของออก
                        favoriteModel.toggleFavorite(index);
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          const Divider(thickness: 2, color: Colors.black),
          
          //Challenge 2
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('\$168', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {
                    // กดแล้วไปหน้า Summary
                    Navigator.pushNamed(context, '/summary');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('BUY'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}