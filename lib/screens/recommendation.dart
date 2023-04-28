import 'package:flutter/material.dart';
import 'package:krishi_gyan/constants/colors.dart';
import 'package:menu_button/menu_button.dart';
import '../widgets/ImageCarousel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const List<String> keys1 = ['One', 'Two', 'Three', 'Four'];
const List<String> keys2 = ['One', 'Two', 'Three', 'Four'];
const List<String> keys3 = ['One', 'Two', 'Three', 'Four'];
const List<String> keys4 = ['One', 'Two', 'Three', 'Four'];

const List<String> items = [
  'Fertilizers',
  'Pesticides',
  'Irrigation Methods',
  'Crops'
];

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);
  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Recommendations',
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
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.30,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.sp),
                      bottomRight: Radius.circular(30.sp),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  'city name',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '32 c',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.9.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Moisture',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Air Pollution',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  children: items.map((e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MenuButton<String>(
                        child: MenuButtonContainer(containername: e),
                        items: keys1,
                        itemBuilder: (String value) => Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 16.sp),
                          child: Text(value),
                        ),
                        toggledChild: MenuButtonContainer(containername: e),
                        onItemSelected: (String value) {
                          setState(() {
                            e = value;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: CarouselWithIndicatorDemo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButtonContainer extends StatelessWidget {
  String containername;
  MenuButtonContainer({Key? key, required this.containername})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 219, 236, 226),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(containername, overflow: TextOverflow.ellipsis)),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
