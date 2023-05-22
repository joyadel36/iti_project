import 'package:flutter/material.dart';
import '../wepage.dart';
import 'my_cart.dart';

class TABS_SCREEN extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TABS_SCREEN_State();
  }
}

class TABS_SCREEN_State extends State<TABS_SCREEN> {
  final List _selectedpage = [
    welpage(),
    MY_CART(),

  ];
  int _selectindex = 0;

  void selecttab(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _selectedpage[_selectindex] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          currentIndex: _selectindex,
          onTap: selecttab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "My Cart",
            ),
          ],
        ),
      ),
    );
  }
}
