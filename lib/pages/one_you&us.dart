import 'package:eventique/core/resources/color.dart';
import 'package:eventique/pages/tt.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class YouAndUsPage extends StatefulWidget {
  const YouAndUsPage({super.key});

  @override
  State<YouAndUsPage> createState() => _YouAndUsPageState();
}

class _YouAndUsPageState extends State<YouAndUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("You & Us",
       style: TextStyle(color:primary,
        fontFamily: 'IrishGrover',fontSize: 28
       ),),
      ),
      body: Column(children: [
        Divider(color: primary,),
        Gap(10),
          Padding(
        padding: EdgeInsets.all(40.0),
        child: 
            RichText(
  text: TextSpan(
 
    // style: TextStyle(backgroundColor: Colors.amber),
    children:  <TextSpan>[
      TextSpan(text: 'Our customers were thrilled, describing their event as a ',style: TextStyle(fontFamily: 'Kanit',
      color: primary)),
      TextSpan(text: ' Magical ', style: TextStyle(fontSize: 20,fontFamily: 'KaushanScript',
      color:Color.fromARGB(251, 234, 61, 101))),
    TextSpan(text: ' experience ',style: TextStyle(fontFamily: 'Kanit',
      color: primary)),
    ],
  ),

                   )      )  , 

// ImageSliderScreen(imgList: ['images/image.png','images/image.png','images/image.png'],),



 
                     Expanded(child: ListView.builder(itemCount: 18,
              itemBuilder: (context,index){
              return
              Column(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration( border: Border.all(
      color: Color(0xFFDB8498), 
      
    ),
    borderRadius: BorderRadius.circular(10.0),),
                      height: 80,
                      width: 337,
                      child: ListTile(title: Text("Dream Cake",style: TextStyle(),),
                      subtitle: Text("Parfait"),
                      leading: Icon(Icons.cake),
                      trailing: Icon(Icons.arrow_forward_ios,),
                      ),
                      
                    ),
                  ),
                  Gap(8)
                ],
              );
            })) 
     
      ],),
    );
  }
}