import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Button extends StatelessWidget {
     final Color BackgroundColor ;
     final Color TextColor ;
     final String text ;

Button({required this.BackgroundColor, required this.text, required this.TextColor




});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height*0.08,

      decoration: BoxDecoration(

        color: BackgroundColor,
        borderRadius: BorderRadius.circular(40),

      ),

      child: Center(
        child: Text(text ,style: TextStyle(

          color: TextColor,
               fontSize: 20



        ),),
      ),






    );
  }
}
