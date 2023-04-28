import 'package:flutter/material.dart';

Widget containerWidget(BuildContext context, String title, String text){
  double height= MediaQuery.of(context).size.height;
  double width= MediaQuery.of(context).size.width;
  return Container(
    height: height*0.1,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Colors.deepPurple.shade300,fontWeight: FontWeight.bold,fontSize: 20,),),
          Text(text,style: TextStyle(color: Colors.deepPurple.shade300,fontWeight: FontWeight.bold,fontSize: 20,),),
        ],
      ),
    ),
  );
}