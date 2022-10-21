import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanagment/Screen/Show_Task.dart';




class Delete_animation extends StatelessWidget {
  const Delete_animation({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child:
            Center(
              child: Lottie.network( 'https://assets6.lottiefiles.com/private_files/lf30_rj4ooq2j.json',

                height: MediaQuery.of(context).size.height*30,
                width: MediaQuery.of(context).size.width*30,


              ),



            ),











      ),



    );
  }
}
