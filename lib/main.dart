import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodSearchPage(),
    );
  }
}

class FoodSearchPage extends StatefulWidget {
  @override
  _FoodSearchPageState createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  String? selectedImage;

  void selectImage(String image) {
    setState(() {
      selectedImage = image;
    });
  }

  void deselectImage() {
    setState(() {
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Food',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/chef_avatar.png'), // Replace with your image asset
            ),
          ],
        ),
      ),
      body: selectedImage == null ? buildGridView() : buildFullScreenImage(),
    );
  }

  Widget buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Found 80 results',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
              children: [
                FoodCard(
                  title: 'Oni Sandwich',
                  subtitle: 'Spicy chicken sandwich',
                  calories: 69,
                  price: 6.72,
                  images: [
                    'assets/oni_sandwich1.png',
                    'assets/oni_sandwich2.png',
                    'assets/oni_sandwich3.png',
                    'assets/oni_sandwich4.png',
                  ],
                  onImageTap: selectImage,
                ),
                FoodCard(
                  title: 'Dan Noodles',
                  subtitle: 'Spicy fruit mixed',
                  calories: 120,
                  price: 8.86,
                  images: [
                    'assets/dan_noodles1.png',
                    'assets/dan_noodles2.png',
                    'assets/dan_noodles3.png',
                    'assets/dan_noodles4.png',
                  ],
                  onImageTap: selectImage,
                ),
                FoodCard(
                  title: 'Chicken Dimsum',
                  subtitle: 'Spicy chicken dimsum',
                  calories: 65,
                  price: 6.99,
                  images: [
                    'assets/chicken_dimsum1.png',
                    'assets/chicken_dimsum2.png',
                    'assets/chicken_dimsum3.png',
                    'assets/chicken_dimsum4.png',
                  ],
                  onImageTap: selectImage,
                ),
                FoodCard(
                  title: 'Egg Pasta',
                  subtitle: 'Spicy chicken pasta',
                  calories: 78,
                  price: 9.80,
                  images: [
                    'assets/egg_pasta1.png',
                    'assets/egg_pasta2.png',
                    'assets/egg_pasta3.png',
                    'assets/egg_pasta4.png',
                  ],
                  onImageTap: selectImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFullScreenImage() {
    return GestureDetector(
      onTap: deselectImage,
      child: Center(
        child: Image.asset(
          selectedImage!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int calories;
  final double price;
  final List<String> images;
  final ValueChanged<String> onImageTap;

  FoodCard({
    required this.title,
    required this.subtitle,
    required this.calories,
    required this.price,
    required this.images,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onImageTap(images[0]), // Use the first image for full screen view
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                images[0], // Display the first image
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.whatshot, color: Colors.orange, size: 20),
                          SizedBox(width: 4),
                          Text('$calories Calories'),
                        ],
                      ),
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
