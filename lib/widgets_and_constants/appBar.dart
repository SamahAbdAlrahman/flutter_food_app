import 'package:flutter/material.dart';
import '../widgets_and_constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.white,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () { Scaffold.of(context).openDrawer(); },
          //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          // ),
          title:
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Current location",style: TextStyle(
                color: Constants.greyColor,
                fontSize: 16
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on , color: Constants.greenColor,),
                  Text("Nablus, Palestine"),

                ],
              )
            ],

          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.notifications))
          ],
        );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}