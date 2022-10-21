import 'package:flutter/material.dart';
import 'package:taskmanagment/karstakan/appcolor.dart';




class Task extends StatelessWidget {

final String text ;

Task({required this.text});

  @override
  Widget build(BuildContext context) {







    return Container(
margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width *0.8,
      height:MediaQuery.of(context).size.height *0.07 ,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: AppColor.smallTextColor

  
),
      child: Center(
        child: Text(text

            ,style: TextStyle(

            fontSize: 20,
          color: AppColor.largeTextColor,



        ),

        ),
      ),


    );
  }
}
