import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanagment/Screen/Add_Task.dart';
import 'package:taskmanagment/Screen/LoadingAnimation.dart';
import 'package:taskmanagment/Screen/WelcomePage.dart';
import 'package:taskmanagment/widget/Task.dart';
import 'package:taskmanagment/widget/spanbutton.dart';

import '../karstakan/appcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowTask extends StatelessWidget {
  String id0;

  ShowTask({Key? key, this.id0 = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime Date = DateTime.now();

    String Dateformat = DateFormat('yyyy-MM-dd – hh:mm').format(Date);

    final Stream<QuerySnapshot> DataStream =
        FirebaseFirestore.instance.collection('task_detail').snapshots();

    Future<void> delete() async {
      final Datadelete = FirebaseFirestore.instance
          .collection('task_detail')
          .doc(id0)
          .delete();
    }

    final Widget leftside = Container(
      padding: const EdgeInsets.only(left: 8),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: AppColor.largeTextColor,
          borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.edit),
    );

    final Widget rightside = Container(
      padding: const EdgeInsets.only(right: 8),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
      child: Icon(Icons.delete),
    );

    List TaskData = [];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 26),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              IconButton(
                splashRadius: 1,
                onPressed: () => Get.to(() => HomeScreen()),
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
                    'https://assets7.lottiefiles.com/packages/lf20_rvd0699u.json'),
              ),
              Container(
                width: width,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.to(() => HomeScreen(),
                          transition: Transition.fadeIn,
                          duration: Duration(seconds: 1)),
                      icon: Icon(Icons.home),
                      color: AppColor.MainColor,
                      splashRadius: 1,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => AddTask(),
                          transition: Transition.downToUp,
                          duration: Duration(seconds: 1)),
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.MainColor),
                        child: Icon(
                          Icons.add,
                          color: AppColor.smallTextColor,
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () => print('hello'),
                      icon: Icon(Icons.calendar_month),
                      color: AppColor.MainColor,
                      splashRadius: 1,
                    ),
                    Text(
                      Dateformat,
                      style: TextStyle(
                          color: AppColor.BackgroundColor, fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: width,
                  height: height * 0.5,
                  child: StreamBuilder(
                    stream: DataStream,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        SnackBar(content: Text('hiii'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot DocSnap =
                                  snapshot.data!.docs[index];

                              return Dismissible(
                                key: ObjectKey(index),
                                background: leftside,
                                secondaryBackground: rightside,
                                //on dis is after confirming

                                // async future keyword
                                // is fro confirming
                                confirmDismiss: (direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    showModalBottomSheet(
                                      //transpert yak color dabe lagar pshtakay background dyar dabe
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.transparent,

                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.largeTextColor
                                                  .withOpacity(0.4),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          height: height * 0.5,
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Button(
                                                  BackgroundColor:
                                                      AppColor.MainColor,
                                                  text: 'View',
                                                  TextColor:
                                                      AppColor.smallTextColor),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Button(
                                                  BackgroundColor:
                                                      AppColor.smallTextColor,
                                                  text: 'Edit',
                                                  TextColor: AppColor.MainColor)
                                            ],
                                          ),
                                        );
                                      },
                                    );

                                    return false;
                                  } else {
                                    return Future.delayed(
                                        Duration(milliseconds: 10), () {
                                      if (direction ==
                                          DismissDirection.endToStart) {
                                        delete();
                                      }
                                    });
                                  }
                                },

                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: width * 0.1, right: width * 0.1),
                                    child: Task(text: DocSnap['task'])),
                              );
                            });
                      }
                      return Text('hi');
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
