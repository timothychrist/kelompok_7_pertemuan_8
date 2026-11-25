import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class StatCard extends StatelessWidget {
  final String title,value,unit,foot; final Color color; final IconData icon;
  const StatCard({required this.title,required this.value,required this.unit,required this.foot,required this.color,required this.icon});
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.all(9),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10),border:Border(left:BorderSide(color:color,width:3),top:const BorderSide(color:line),right:const BorderSide(color:line),bottom:const BorderSide(color:line))),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(children:[Expanded(child:Text(title,style:const TextStyle(fontSize:9,color:muted))),Icon(icon,color:color,size:12)]),const SizedBox(height:5),Text(value,style:const TextStyle(fontSize:19,fontWeight:FontWeight.w800,color:ink)),Text(unit,style:const TextStyle(fontSize:8,color:muted)),const SizedBox(height:5),Text(foot,style:TextStyle(fontSize:8,color:color,fontWeight:FontWeight.w700))]));
}
