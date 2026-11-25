import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class SummaryBox extends StatelessWidget {
  final String title,value,unit; final Color color; const SummaryBox({required this.title,required this.value,required this.unit,required this.color});
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.all(9),decoration:BoxDecoration(color:color,borderRadius:BorderRadius.circular(8)),child:Column(children:[Text(title,style:const TextStyle(fontSize:8,color:muted)),const SizedBox(height:4),Text(value,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w800,color:ink)),Text(unit,style:const TextStyle(fontSize:8,color:muted))]));
}
