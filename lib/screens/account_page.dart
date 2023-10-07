import 'package:flutter/material.dart';
import 'package:krishi_gyan/provider/loginProvider.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/graphCard.dart';

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
          title: Center(
            child: Text(
              'Account',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
          ),
          backgroundColor: darkGreen,
          elevation: 0,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.sp),
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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  boxShadow: const [
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
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: darkGreen,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: BarChartSample1()),
                    ],
                  ),
                ),
              ),
              Container(
                height: 42.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                  boxShadow: const [
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
                                  Text(
                                    'Name: ',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "(UID)${context.read<Login>().currentUser!.uid}",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                                  Text(
                                    'Mobile No.: ',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    e['mobile'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                                  Text(
                                    'Location: ',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    e['location'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                                  Text(
                                    'Crop Name: ',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    e['crop'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                                  Text(
                                    'Soil Moisture: ',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    e['soilMoisture'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                                  Text(
                                    'Nitrogen Content: ',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    e['nitrogenContent'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                onPressed: () async => await context
                    .read<Login>()
                    .signOut()
                    .onError(
                      (error, _) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Something went wrong while signing out...'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      ),
                    ),
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16.sp),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: darkGreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
