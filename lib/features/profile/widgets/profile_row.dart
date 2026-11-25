import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class ProfileRow extends StatelessWidget {
  final IconData icon;final String label,value;const ProfileRow({required this.icon,required this.label,required this.value});
  @override Widget build(BuildContext context)=>Row(children:[Icon(icon,size:17,color:navy),const SizedBox(width:10),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:const TextStyle(fontSize:9,color:muted)),const SizedBox(height:3),Text(value,style:const TextStyle(fontSize:11,fontWeight:FontWeight.w700,color:ink))]))]);
}
