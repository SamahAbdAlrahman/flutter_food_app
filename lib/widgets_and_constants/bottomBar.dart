import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/widgets_and_constants/constants.dart';
import 'package:food_app/widgets_and_constants/drawer_widget.dart';
import '../widgets_and_constants/appBar.dart';
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0; 

  final List<Widget> bodyOptions = [
    home(),
    Center(child: Text('Favorite Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWidget() ,
        drawer: drawer_widget(),
      body: bodyOptions[selectedIndex], // الصفحة المعروضة بناءً على التبويب
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex, // التبويب النشط
        onTap: (index) {
          setState(() {
            selectedIndex = index; // تحديث التبويب النشط عند التغيير
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // activeIcon:Icon(Icons.home,color:Colors.white ,),
            label: 'Home',
                   

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            // activeIcon:Icon(Icons.favorite,color:Colors.white ,),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // activeIcon:Icon(Icons.person,color:Colors.white ,),
            label: 'Profile',
          ),
        ],
          type: BottomNavigationBarType.shifting, // نمط الحركة لما اكبس 
        selectedItemColor: Constants.mainColor, // لون النص أو الأيقونة عند التفعيل
        unselectedItemColor:Colors.black38 , // لون النص أو الأيقونة غير النشطة
      ),
    );
  }
}
