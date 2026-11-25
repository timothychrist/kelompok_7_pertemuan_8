import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/app_card.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/status_pill.dart';

class MiniHistoryCard extends StatelessWidget {
  final String date,time,status,out;final Color color;
  const MiniHistoryCard({required this.date,required this.time,required this.status,required this.color,required this.out});
  @override Widget build(BuildContext context)=>appCard(child:Row(children:[Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(date,style:const TextStyle(fontSize:10,fontWeight:FontWeight.w800,color:ink)),const SizedBox(height:5),Text('Masuk: $time   Pulang: $out',style:const TextStyle(fontSize:9,color:muted))])),StatusPill(status,color)]));
}
