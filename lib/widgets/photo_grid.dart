import 'package:akshay/core/container/api.dart';
import 'package:akshay/model/photos_model.dart';
import 'package:akshay/widgets/photo_tile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PhotoGrid extends StatefulWidget {


  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {


  List<PhotosModel> _photosData = [];

    Future<void> _fetchPhotos() async{
      PhototsAPI _photosAPI = PhototsAPI ();
      List<PhotosModel> _tempPhotodData = await _photosAPI.fetchPhotos().catchError((err) => print(err));
      setState(() => _photosData = _tempPhotodData );
    }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _photosData.length,
      shrinkWrap: true,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2), 
      itemBuilder: (ctx,index) => PhotoTile(url: _photosData[index].imgURL,),
    );
  }
}



