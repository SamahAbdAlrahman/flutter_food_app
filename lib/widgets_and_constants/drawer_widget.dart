import 'package:flutter/material.dart';

class drawer_widget extends StatelessWidget {
  const drawer_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Text("data")
        ],
      ),
    );
  }
}
