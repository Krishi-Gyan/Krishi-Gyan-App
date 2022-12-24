import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krishi_gyan/recommendation.dart';
import './cards.dart';
import 'account_page.dart';

enum widgetmake { buy, sell }

class mandi extends StatefulWidget {
  @override
  State<mandi> createState() => _mandiState();
}

class _mandiState extends State<mandi> {
  widgetmake b = widgetmake.buy;

  @override
  Widget build(BuildContext context) {
    // widgetmake s = widgetmake.sell;
    String datetime = DateTime.now().toString();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        // ignore: unnecessary_new
        new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/landing_page_pic.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),

        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.black12, //color
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        datetime,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                      ),
                      Icon(Icons.person)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12, //color
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                height: size.height * 0.5,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                b = widgetmake.buy;
                              });
                            },
                            child: Text("Buy",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: (b == widgetmake.buy)
                                        ? Colors.black
                                        : Colors.black54)),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                b = widgetmake.sell;
                              });
                            },
                            child: Text(
                              "Sell",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: (b == widgetmake.sell)
                                      ? Colors.black
                                      : Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: getCustomContainer(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      backgroundColor: Color.fromARGB(255, 189, 207, 135),
    );
  }

  Widget getCustomContainer() {
    switch (b) {
      case widgetmake.buy:
        return getbuycard();
      case widgetmake.sell:
        return getsellform();
    }
    return getsellform();
  }

  Widget getsellform() {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.tree),
                title: TextFormField(
                  // controller: passwordController,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'CROP',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.moneyBill1Wave),
                title: TextFormField(
                  // controller: passwordController,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Price',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.weightScale),
                title: TextFormField(
                  // controller: passwordController,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Yeild Amount',
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        'YOUR CROP is listed',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(' List'),
              style: ElevatedButton.styleFrom(
                elevation: 40,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                //   style: TextStyle(
                //       color: Colors.blue, fontWeight: FontWeight.bold),
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getbuycard() {
    return Column(
      children: [
        cards(),
        cards(),
        cards(),
      ],
    );
  }
}
