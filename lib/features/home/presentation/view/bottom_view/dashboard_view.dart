// import 'package:flutter/material.dart';

// class DashboardView extends StatelessWidget {
//   const DashboardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Dashboard View',
//         style: TextStyle(fontSize: 30),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message
              const Text(
                'Welcome to Doko Platter!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search food...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories
              const Text(
                'Top Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryCard('Pizza', 'assets/images/pizza.jpg'),
                    categoryCard('Burgers', 'assets/images/burger.jpg'),
                    categoryCard('Drinks', 'assets/images/drink.jpg'),
                    categoryCard('Desserts', 'assets/images/dessert.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Popular Items
              const Text(
                'Popular Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  foodItemCard(
                      'Margherita Pizza', 'Rs. 350', 'assets/images/pizza.jpg'),
                  foodItemCard(
                      'Cheese Burger', 'Rs. 250', 'assets/images/burger.jpg'),
                  foodItemCard(
                      'Cold Coffee', 'Rs. 150', 'assets/images/drink.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Category Card Widget
  Widget categoryCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Food Item Card Widget
  Widget foodItemCard(String title, String price, String imagePath) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price, style: const TextStyle(color: Colors.green)),
        trailing: ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade300),
          onPressed: () {},
          child: const Text('Add'),
        ),
      ),
    );
  }
}
