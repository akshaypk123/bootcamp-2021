

import 'package:akshay/model/photos_model.dart';
import 'package:akshay/screen/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'topbar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {  
  void _profileEdit() {
    Navigator.of(context).pushNamed(ProfileScreen.routename ,arguments: "kichu").then((value) => print("object $value"));
  }




  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileTab(),
              const SizedBox(height: 10),
              Text('Photography',style: TextStyle(fontSize: 22 ,color: Colors.green),),
              const SizedBox(height: 10),
              PhotoGrid()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _profileEdit , child: Icon(Icons.edit)),    
    );
  }

  ValueListenableBuilder<Box<dynamic>> profileTab() {
    return ValueListenableBuilder(
              valueListenable: Hive.box('profile').listenable(),                
              builder: (BuildContext context,Box value, Widget? child) => TopBar(
                title: value.get('name'),
                subtitle: 'Developer',
                color: Color(0xff087118),
              ),
            );
  }
}

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({
    Key? key,
    required List<PhotosModel> photosData,
  }) : _photosData = photosData, super(key: key);

  final List<PhotosModel> _photosData;

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
     itemBuilder: (ctx,index) => Container(
       padding: EdgeInsets.all(10),
       child: Image.network( _photosData[index].imgURL, fit: BoxFit.cover,),
     ),
     );
  }
}