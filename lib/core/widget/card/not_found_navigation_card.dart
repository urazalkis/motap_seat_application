import 'package:flutter/material.dart';
class NotFoundNavigationCard extends StatelessWidget {
  const NotFoundNavigationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Not Found")
            ],
          ),
        ],

    )
    );
  }
}
