

import 'package:akshay/model/photos_model.dart';
import 'package:akshay/screen/profile_screen.dart';
import 'package:dio/dio.dart';
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
  List<PhotosModel> _photosData =[];

  Future<void> _fetchphotos() async{

    final _dioInstance = Dio(); 
    _dioInstance.options.headers["Authorization"] = "Client-ID 168KPXQhJviFtqX7AmV0gGA28IJ62BrzbxFrVAnqJJE";
    
    final _fetchData = await _dioInstance.get('https://api.unsplash.com/photos');
    for (var _items in _fetchData.data) {
      setState(() {
        _photosData.add(PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
      });
      
    }
    //_fetchData.data;
    print(_fetchData);
    
  }

@override
  void initState() {
    _fetchphotos();
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: Hive.box('profile').listenable(),                
                builder: (BuildContext context,Box value, Widget? child) => TopBar(
                  title: value.get('name'),
                  subtitle: 'Developer',
                  color: Color(0xff087118),
                ),
              ),
              const SizedBox(height: 10),
              Text('Photography',style: TextStyle(fontSize: 22 ,color: Colors.green),),
              const SizedBox(height: 10),
              GridView.builder(
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
               )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed(ProfileScreen.routename);
        },
        child: Icon(Icons.edit),),    
    );
  }
}
