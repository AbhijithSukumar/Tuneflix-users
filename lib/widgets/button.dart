import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
   final String text;
   final void Function()? onTap;
  const Mybutton({super.key, required this.text,required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        padding:EdgeInsets.all(20) ,
        color: Colors.red,
        child: Center(
          child: Text(text,style:const TextStyle(color: Colors.white,fontSize: 20)),
        ),
      ),
      
      
    );
  }
}