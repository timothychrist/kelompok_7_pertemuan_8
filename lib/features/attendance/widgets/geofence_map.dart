import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class GeofenceMap extends StatelessWidget {
  const GeofenceMap();
  @override Widget build(BuildContext context) => Container(height: 178, width: double.infinity, decoration: BoxDecoration(color: const Color(0xFFEAF0FB), borderRadius: BorderRadius.circular(9)), child: CustomPaint(painter: _MapPainter(), child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.location_on, size: 27, color: navy), Text('Kantor Pusat (50m)', style: TextStyle(fontSize: 9, color: navy, fontWeight: FontWeight.w700))]))));
}
class _MapPainter extends CustomPainter {
  @override void paint(Canvas canvas, Size s) {
    final road = Paint()..color = Colors.white..strokeWidth = 18..style = PaintingStyle.stroke;
    final thin = Paint()..color = const Color(0xFFD7E1F0)..strokeWidth = 1;
    for (int i=1;i<5;i++) { final x=s.width*i/5; canvas.drawLine(Offset(x,0),Offset(x,s.height),road); canvas.drawLine(Offset(0,s.height*i/5),Offset(s.width,s.height*i/5),road); }
    for (int i=1;i<5;i++) { final x=s.width*i/5; canvas.drawLine(Offset(x,0),Offset(x,s.height),thin); canvas.drawLine(Offset(0,s.height*i/5),Offset(s.width,s.height*i/5),thin); }
    final center=Offset(s.width*.51,s.height*.51);
    canvas.drawCircle(center, 45, Paint()..color=navy.withOpacity(.10));
    canvas.drawCircle(center, 45, Paint()..color=navy..style=PaintingStyle.stroke..strokeWidth=1.5);
    canvas.drawCircle(center, 4, Paint()..color=navy);
    final dot=Paint()..color=cyan; canvas.drawCircle(Offset(s.width*.18,s.height*.25),4,dot); canvas.drawCircle(Offset(s.width*.82,s.height*.72),4,dot);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(s.width-95,s.height-25,84,17),const Radius.circular(4)),Paint()..color=Colors.white);
    final tp=TextPainter(text:const TextSpan(text:'GPS Terkunci • ±4m',style:TextStyle(fontSize:7,color:muted)),textDirection:TextDirection.ltr); tp.layout(); tp.paint(canvas,Offset(s.width-90,s.height-22));
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}
