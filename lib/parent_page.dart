import 'package:advance_app/pages/home_page.dart';
import 'package:flutter/material.dart';


class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  int selectedIndex=0;
  List<Widget> body=[
      HomePage(),
      Icon(Icons.play_circle),
      Icon(Icons.person_2_sharp),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],//setted the body
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          //===============setselectedIndex to current on Tap
          onTap: (int newIndex){
            setState(() {
              selectedIndex=newIndex;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 217, 99, 3),
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          
          items: 
        [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Profile'),
        ]),
      ),
    );
  }
}