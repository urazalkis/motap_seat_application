import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
class NoConnectionCard extends StatelessWidget {
  const NoConnectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: context.screenHeight/5,
      width: context.screenWidth/3,
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 10,
        shadowColor: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            topLeft:Radius.circular(50),
          ),
          side: BorderSide(width: 1,color: Colors.blueGrey),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(child:Text("İnternet bağlantısı sağlanamadı.Lütfen ağınızı kontrol ediniz",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
