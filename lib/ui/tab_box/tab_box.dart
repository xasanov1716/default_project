import 'package:api_default_project/ui/tab_box/car_screen/car_screen.dart';
import 'package:api_default_project/ui/tab_box/companies_screen/car_item.dart';
import 'package:api_default_project/ui/tab_box/countries_screen/countries_screen.dart';
import 'package:flutter/material.dart';


class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {


  List<Widget> screens = [];
  int currentIndex = 0;

  @override
  void initState() {
  screens.add(CountryScreen());
  screens.add(CarItemScreen());
  screens.add(CarsScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (v){
          currentIndex = v;
          setState(() {

          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.countertops_rounded),label: 'Countries'),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Companies'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Car'),
        ],
      ),
    );
  }
}
