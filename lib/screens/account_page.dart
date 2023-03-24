import 'package:flutter/material.dart';

import '../constants/colors.dart';

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
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: darkGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Order Status',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: darkGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Expert Status',
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
                height: 500,
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Card(
                          child: Row(
                            children: [
                              const Text('Name: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['name']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Row(
                            children: [
                              const Text('Mobile No.: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['mobile']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Row(
                            children: [
                              const Text('Location: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['location']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Row(
                            children: [
                              const Text('Crop Name: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['crop']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Row(
                            children: [
                              const Text('Soil Moisture: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['soilMoisture']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          child: Row(
                            children: [
                              const Text('Nitrogen Content: '),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(e['nitrogenContent']),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
