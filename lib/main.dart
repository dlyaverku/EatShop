import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:my_app/NavBar.dart';
import 'package:my_app/styles.dart';

Color cardColor = Color(0xFF8B2FDC);

void main() => runApp(const MyApp());
  


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

static const String _title = "ShopApp";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
    body: 
    InfoCard(title: "Water", cardColor: cardColor, onMoreTap: (){
      AlertDialog(
        title: const Text('You pressed me!'),
       actions: <Widget> [
         TextButton(
         child: const Text('Approve'),
         onPressed: () {
           Navigator.of(context).pop();
         }, 
         )
       ],
      );
    },),
    //InfoCard(),
    
    
      bottomNavigationBar: NavBottomBar(),
      ),
    );
  }
}



class InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final Color cardColor;
  final Function() onMoreTap;

  final String subInfoTitle;
  final String subInfoText;
  final Widget subIcon;

  const InfoCard(
      {required this.title,
     this.body =
          "Lorem ipsum dolor sit amet, consectutur adipiscing elit, sed do eiusmod", 
     required this.onMoreTap,
     required this.cardColor,
      this.subIcon = const CircleAvatar(
        child: 
        Icon(
          Icons.favorite_outline_sharp,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF8B2FDC),
        radius: 25,
      ),
      this.subInfoText = "12.99\$",
      this.subInfoTitle = "Price",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: Offset(0,8),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          color: cardColor,
          //color: Color(0xFFBBACF0),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 75,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: onMoreTap,
                  child: Center(
                      child: Text(
                    "More",
                    style: TextStyle(color: Color(0xFF8B2FDC)),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            body,
            style:
                TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  subIcon,
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subInfoTitle),
                      Text(
                        subInfoText,
                        style: TextStyle(
                          color: Color(0xFF26CE86),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

