import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Profile & Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://images.pexels.com/photos/30594080/pexels-photo-30594080.jpeg',
          height: 100,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile & Gallery')),
      body: Column(
        children: [
          SizedBox(height: 20),
          ProfileCard(),
          Expanded(child: ImageGallery()),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/27860371/pexels-photo-27860371.jpeg'),
            ),
            SizedBox(height: 10),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Flutter Developer'),
          ],
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/27860371/pexels-photo-27860371.jpeg',
    'https://images.pexels.com/photos/30594080/pexels-photo-30594080.jpeg',
    'https://images.pexels.com/photos/27860371/pexels-photo-27860371.jpeg',
    'https://images.pexels.com/photos/30594080/pexels-photo-30594080.jpeg',
    'https://images.pexels.com/photos/27860371/pexels-photo-27860371.jpeg',
    'https://images.pexels.com/photos/30594080/pexels-photo-30594080.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imageUrls[index], fit: BoxFit.cover),
        );
      },
    );
  }
}