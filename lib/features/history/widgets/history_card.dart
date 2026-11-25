import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/app_card.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/status_pill.dart';

class HistoryCard extends StatelessWidget {
  final String day,number,date,checkIn,checkOut,status;final Color color;
  const HistoryCard({required this.day,required this.number,required this.date,required this.checkIn,required this.checkOut,required this.status,required this.color});
  @override Widget build(BuildContext context)=>appCard(child:Column(children:[
    Row(children:[Container(width:34,padding:const EdgeInsets.symmetric(vertical:6),decoration:BoxDecoration(color:const Color(0xFFEEF2FF),borderRadius:BorderRadius.circular(7)),child:Column(children:[Text(day,style:const TextStyle(fontSize:7,color:navy,fontWeight:FontWeight.w700)),Text(number,style:const TextStyle(fontSize:14,color:navy,fontWeight:FontWeight.w800))])),const SizedBox(width:9),Expanded(child:Text(date,style:const TextStyle(fontSize:11,fontWeight:FontWeight.w800,color:ink))),StatusPill(status,color)]),
    const Divider(color:line,height:18),
    Row(children:[Expanded(child:historyTime('Check-in',checkIn,green)),Expanded(child:historyTime('Check-out',checkOut,navy)),Expanded(child:historyTime('Total Durasi','9j 11m',muted))]),
    const SizedBox(height:9),const Row(children:[Icon(Icons.apartment,size:11,color:muted),SizedBox(width:5),Text('Kantor Utama',style:TextStyle(fontSize:8,color:muted)),Spacer(),Icon(Icons.verified_user_outlined,size:10,color:cyan),SizedBox(width:4),Text('Geofence OK',style:TextStyle(fontSize:8,color:cyan,fontWeight:FontWeight.w700))]),
  ]));
}
Widget historyTime(String label,String value,Color color)=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:const TextStyle(fontSize:8,color:muted)),const SizedBox(height:4),Row(children:[Icon(Icons.access_time,size:11,color:color),const SizedBox(width:3),Text(value,style:const TextStyle(fontSize:9,fontWeight:FontWeight.w700,color:ink))])]);
