import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagment/Screen/Add_Task.dart';
import 'package:taskmanagment/Screen/Show_Task.dart';
import 'package:taskmanagment/widget/spanbutton.dart';
import '../karstakan/appcolor.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;




    return Scaffold(

      body: Container(
        height: height,
        width: width,

          decoration: BoxDecoration(

          image: DecorationImage(
fit: BoxFit.cover,

          image: AssetImage(
     "img/BlueBack.jpg"
      )


      )



      ),

padding: const EdgeInsets.only(left: 15,right: 15),
child: Column(

crossAxisAlignment: CrossAxisAlignment.start,
  children: [
SizedBox(height: height*0.16),

    RichText(



        text: TextSpan(
          text: 'Hello',
          style: TextStyle(

              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: AppColor.MainColor

          ),
          children:  [
            TextSpan(
              text: '\nStart Your Beautiful Day'
              ,style: TextStyle(

                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.MainColor



            )


            )


          ]




        ),




    ),
    SizedBox(height: height * 0.4,),
            
            InkWell(
              onTap: ()=> Get.to(()=> AddTask(),transition: Transition.fade,duration: Duration(seconds: 1)),
              child: Button(
                  BackgroundColor: AppColor.MainColor.withOpacity(0.7),
                  text: 'Add Task',
                  TextColor: AppColor.smallTextColor.withOpacity(1)),
            ),
            
            SizedBox(height: height*0.03,),
            
            InkWell(
              onTap: ()=> Get.to(()=>ShowTask(),transition: Transition.fadeIn,duration: Duration(seconds: 1)),
              child: Button(
                  BackgroundColor: AppColor.largeTextColor.withOpacity(0.9),
                  text: 'View All',
                  TextColor: AppColor.MainColor),
            )
          ],



),







      ),




    );
  }
}

