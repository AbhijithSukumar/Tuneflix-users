

import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex=0;
  late PageController pageController;
  @override
  void initState() {
    
    super.initState();
    pageController =PageController(initialPage: selectedIndex);
  }
  void onItemTapped(int index){
    setState(() {
      selectedIndex=index;
      pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: PageView(
            controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children:const [
           
          ],
          
        ),
            bottomNavigationBar: BottomNavigationBar(currentIndex: selectedIndex,
    onTap: onItemTapped,
    backgroundColor: Colors.grey,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.black,
    items:const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home),),
      BottomNavigationBarItem(icon: Icon(Icons.search),),
      
      BottomNavigationBarItem(icon: Icon(Icons.chat),),
      ])  );
                   
        }
        
    
  }
