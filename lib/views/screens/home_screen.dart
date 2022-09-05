import 'package:bootcamp_app/views/screens/blog_list_screen.dart';
import 'package:bootcamp_app/views/screens/favorite_blog_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  List<Widget> pages = [
    BlogsListScreen(),
    FavoriteBlogsListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 5,
        items: [
          BottomNavigationBarItem(
            label: 'All',
            icon: Icon(Icons.featured_play_list_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
