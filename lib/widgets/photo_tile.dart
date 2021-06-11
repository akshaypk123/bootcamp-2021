import 'package:flutter/material.dart';

class PhotoTile extends StatelessWidget {
  
  final String url;
  PhotoTile({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Image.network( url , fit: BoxFit.cover,),
    );
  }
}