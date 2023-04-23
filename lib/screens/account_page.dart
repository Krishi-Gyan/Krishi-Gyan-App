import 'package:flutter/material.dart';
import 'package:krishi_gyan/main.dart';
import 'package:krishi_gyan/provider/loginProvider.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List profile = [
    {
      "name": "Lorem Ipsum",
      "mobile": "Lorem Ipsum",
      "location": "Lorem Ipsum",
      "crop": "Lorem Ipsum",
      "soilMoisture": "Lorem Ipsum",
      "nitrogenContent": "Lorem Ipsum",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Account',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: darkGreen,
          elevation: 0,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Container(
                height: 30.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        -5.0,
                        -5.0,
                      ),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.5.h),
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: darkGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Soil Status',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        -5.0,
                        -5.0,
                      ),
                    ),
                  ],
                ),
                child: Column(
                    children: profile.map((e) {
                  return Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6.h,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  const Text('Name: '),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(e['name']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.2.h,
                        ),
                        SizedBox(
                          height: 6.h,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  const Text('Mobile No.: '),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(e['mobile']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.2.h,
                        ),
                        SizedBox(
                          height: 6.h,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  const Text('Location: '),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(e['location']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.2.h,
                        ),
                        SizedBox(
                          height: 6.h,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  const Text('Crop Name: '),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(e['crop']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.2.h,
                        ),
                        SizedBox(
                          height: 6.h,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  const Text('Soil Moisture: '),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(e['soilMoisture']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.2.h,
                        ),
                        SizedBox(
                          height: 6.h,
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  const Text('Nitrogen Content: '),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(e['nitrogenContent']),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  );
                }).toList()),
              ),
              ElevatedButton(
                onPressed: () {
                  print("hitting");
                  context
                      .read<Login>()
                      .signOutFunction()
                      .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainApp(),
                          ),
                          (route) => false));
                },
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
