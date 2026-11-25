import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class DataChip extends StatelessWidget {
  final String label,value; final bool greenText; const DataChip({required this.label,required this.value,this.greenText=false});
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.all(8),decoration:BoxDecoration(color:bg,borderRadius:BorderRadius.circular(7)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:const TextStyle(fontSize:7,color:muted)),const SizedBox(height:4),Text(value,style:TextStyle(fontSize:9,fontWeight:FontWeight.w700,color:greenText?green:ink))]));
}
