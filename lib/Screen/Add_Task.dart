import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanagment/Screen/Show_Task.dart';
import 'package:taskmanagment/karstakan/appcolor.dart';
import 'package:taskmanagment/widget/spanbutton.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    Future AddtaskdetailData(
        {required String task1,
        required String detail1,
        required String Doc}) async {
      final task =
          FirebaseFirestore.instance.collection('task_detail').doc(Doc);

      final json = {
        'detail': detail1,
        'task': task1,
      };
      await task.set(json);
    }

    TextEditingController Task = TextEditingController();
    TextEditingController Detail = TextEditingController();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              IconButton(
                splashRadius: 1,
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColor.MainColor,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.3,
                width: width,
                child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_ZcIjtY.json'),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              TextField(
                controller: Task,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Add Task',
                    filled: true,
                    fillColor: AppColor.smallTextColor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.MainColor,
                            width: 2,
                            style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.smallTextColor,
                            style: BorderStyle.solid,
                            width: 1))),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextField(
                controller: Detail,
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: 'Task detail',
                    filled: true,
                    fillColor: AppColor.smallTextColor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.MainColor,
                            width: 2,
                            style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColor.smallTextColor,
                            style: BorderStyle.solid,
                            width: 1))),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    final task = Task.text;
                    final detail = Detail.text;
                    AddtaskdetailData(
                        task1: Task.text, detail1: Detail.text, Doc: Task.text);

                    Future.delayed(Duration(milliseconds: 500));

                    Get.to(() => ShowTask(
                          id0: Task.text,
                        ));
                  });
                },
                child: Button(
                    BackgroundColor: AppColor.MainColor,
                    text: 'Add',
                    TextColor: AppColor.smallTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
