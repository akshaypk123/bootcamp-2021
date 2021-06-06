import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../topbar.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                title: 'Akshay P K',
                subtitle: 'Developer',
                color: Color(0xff087118),
              ),
              const SizedBox(height: 10),
              Text('Photography',style: TextStyle(fontSize: 22 ,color: Colors.green),),
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 4,
                shrinkWrap: true,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2), 
               itemBuilder: (ctx,index) => Container(
                 padding: EdgeInsets.all(10),
                 child: Image.network('https://images.unsplash.com/photo-1622976383598-63a52ddd77be?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80', fit: BoxFit.cover,),
               ),
               )
            ],
          ),
        ),
      ),    
    );
  }
}
