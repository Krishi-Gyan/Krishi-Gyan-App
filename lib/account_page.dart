import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      //background image
      body: Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Icon(
              Icons.account_circle_outlined,
              size: 50,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black12,
            child: Column(
              children: [
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //phone number
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'phone number',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
          //second container

          Container(
            height: 100,
            width: double.infinity,
            color: Colors.black12,
            child: Column(
              children: [
                //crop name
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Crop Name',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Location
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Soil moisture
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Soil Moisture',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Nitrogen Content
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Nitrogen Content',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            height: 80,
            width: double.infinity,
            color: Colors.black12,
            child: Column(
              children: [
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order Status',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            height: 100,
            width: double.infinity,
            color: Colors.black12,
            child: Column(
              children: [
                Positioned(
                  top: 20,
                  left: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Expert Status',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 500,
                  child: TextButton(
                    child: Text('Call the Expert'),
                    onPressed: () {},
                    //style: ButtonStyle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
