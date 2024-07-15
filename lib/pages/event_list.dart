import 'package:eventique/core/resources/color.dart';
import 'package:eventique/pages/create_event.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
          length: 2,
      child:  Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
       actions: [ IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
       Gap(20), Text("Events",
        style: TextStyle(
          color: primary,
          fontSize: 28,
          fontFamily: 'IrishGrover'
        ),),Gap(165),
        IconButton(onPressed: (){}, icon:Icon(Icons.search)),Gap(20)],
      bottom: TabBar(tabs: [Text("Planning",style: TextStyle(color: primary,fontSize: 22,fontFamily: 'IrishGrover'),),Text("Completed",style: TextStyle(color: secondary,fontSize: 22,fontFamily: 'IrishGrover'),) ]), 
            ), 
            body: TabBarView(children: [ 
              Scaffold( 
                backgroundColor: white, 
                floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
              ), 
              Scaffold( 
                backgroundColor: Colors.green, 
              ) 
            ]
      ),
    ));
  }
}
