import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

// import 'package:my_app/CardInfo.dart';


class NavBottomBar extends StatefulWidget {
 const NavBottomBar ({Key? key}) : super(key: key);

  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {

  int _currentIndex = 0;

  final screen = [
   Center(child: InfoCard(cardColor: Color(0xFFBBACF0), title: "Water", onMoreTap: (){},)),
   Center(child: InfoCard(cardColor: Colors.deepOrangeAccent, title: "Coffee", onMoreTap: (){},)),
   Center(child: InfoCard(cardColor: Colors.greenAccent, title: "Cheese", onMoreTap: (){},)),
   Center(child: InfoCard(cardColor: Colors.brown, title: "Bread", onMoreTap: (){},)),
  ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
      title:
          const Text("Shop", style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0xFF8B2FDC),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF42B7E1), Color(0xFF8B2FDC)],
            stops: [0.5, 1.0],
          ),
        ),
      ),
    ),
     body: screen[_currentIndex],
     bottomNavigationBar: Container(
     child: BottomAppBar(
       elevation: 0,
       color: Colors.white,
       child: SizedBox(
         height: 56,
         width: MediaQuery.of(context).size.width,
         child: Padding(
           padding: EdgeInsets.only(left: 25.0, right: 25.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IconBottomBar(
                 text: "Home", 
                 icon: Icons.home,
                 selected: _currentIndex == 0,
                 onPressed: () {
                   setState(() {
                     _currentIndex = 0;
                   });
                 }),
                 IconBottomBar(
                 text: "Search", 
                 icon: Icons.search,
                 selected: _currentIndex == 1,
                 onPressed: () {
                   setState(() {
                     _currentIndex = 1;
                   });
                 }),
                 IconBottomBar(
                 text: "Orders", 
                 icon: Icons.local_grocery_store_rounded,
                 selected: _currentIndex == 2,
                 onPressed: () {
                   setState(() {
                     _currentIndex = 2;
                   });
                 }),
                 IconBottomBar(
                 text: "Profile",
                 icon: Icons.person,
                 selected: _currentIndex == 3,
                 onPressed: () {
                   setState(() {
                     _currentIndex = 3;
                   });
                 }),
             ],
           ),
         ),
         ),
      ),
   ));
 }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar({
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
          onPressed: onPressed, 
          icon: Icon(icon, size: 30, color: selected ? Color(0xFF8B2FDC) : Colors.grey[500],)),
        Text(text, style: TextStyle(fontSize: 12, height: 0.2, color: selected ? Color(0xFF8B2FDC) : Colors.grey[500]))
        ],
      );
    }
  }

