import 'package:flutter/material.dart';

class StatusPill extends StatelessWidget {
  final String text; final Color color; const StatusPill(this.text,this.color);
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.symmetric(horizontal:7,vertical:4),decoration:BoxDecoration(color:color.withOpacity(.10),borderRadius:BorderRadius.circular(20)),child:Text('• $text',style:TextStyle(fontSize:8,color:color,fontWeight:FontWeight.w700)));
}
