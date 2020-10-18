import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_api_project/pages/list_card.dart';
import 'package:flutter_basic_api_project/pages/simple_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  PageController pageController;
  int pageIndex = 0;
 @override
void initState() {
    super.initState();
    pageController = PageController();    
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      //pageController.currentPageIndicatorTintColor    = Colors.black;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        children: <Widget>[
            SimpleCard(),
            ListsWithJSON()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,        
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.orange,
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.black,
        //inactiveColor: Colors.orangeAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined))
        ],
      ),
    );
  }
}