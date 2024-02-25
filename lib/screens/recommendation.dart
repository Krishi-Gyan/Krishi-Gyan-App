import 'package:flutter/material.dart';
import 'package:krishi_gyan/const.dart';
import 'package:krishi_gyan/constants/colors.dart';
import 'package:menu_button/menu_button.dart';
import '../widgets/ImageCarousel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const List<String> keys1 = [
  '10 kg Zinc Sulphate/ac',
  'SSP 150 kg/ac',
  'Zn SO4 10 kg/ac',
  'FYM 25 t/ac'
];
const List<String> keys2 = [
  'Bromadiolone 00.005% RB',
  'Cypermethrin 10.00% EC',
  'Fipronil 00.30% GR'
];
const List<String> keys3 = ['Drip Irrigation', 'Sprinkler Method'];

const List<String> keys4 = ['Soybeans', 'Sorghum'];

const List<String> items = [
  'Fertilizers',
  'Pesticides',
  'Irrigation Methods',
  'Crops',
];

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);
  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Home',
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: isExpanded == false
                          ? size.height * 0.32
                          : size.height * 0.42,
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
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Current Crop",
                                  style: TextStyle(
                                    color: greenTitle,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: greenTitle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 13.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/wheat.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1.h,
                                    left: 2.w,
                                    child: Text(
                                      "Wheat",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded == false
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      Text(
                                        "Irrigation Methods: Sprinkler method",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Fertilizers: Urea 146 kg/ac, MOP 40 kg/ac",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Pesticides: Bromadiolone 00.005% RB",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width / 2 - 5.w,
                      top: isExpanded == false ? 27.h : 37.h,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greenTitle,
                          ),
                          child: Center(
                            child: Icon(
                              isExpanded == false
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: Text(
                      "Recommendations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    child: Text(
                      "Select from the following dropdowns to make it current",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  children: [
                    MenuButton<String>(
                      items: keys1,
                      itemBuilder: (String value) => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.sp),
                        child: Text(value),
                      ),
                      toggledChild:
                          MenuButtonContainer(containername: items[0]),
                      onItemSelected: (String value) {
                        setState(() {
                          items[0] = value;
                        });
                      },
                      child: MenuButtonContainer(containername: items[0]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MenuButton<String>(
                      items: keys2,
                      itemBuilder: (String value) => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.sp),
                        child: Text(value),
                      ),
                      toggledChild:
                          MenuButtonContainer(containername: items[1]),
                      onItemSelected: (String value) {
                        setState(() {
                          items[1] = value;
                        });
                      },
                      child: MenuButtonContainer(containername: items[1]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MenuButton<String>(
                      items: keys3,
                      itemBuilder: (String value) => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.sp),
                        child: Text(value),
                      ),
                      toggledChild:
                          MenuButtonContainer(containername: items[2]),
                      onItemSelected: (String value) {
                        setState(() {
                          items[2] = value;
                        });
                      },
                      child: MenuButtonContainer(containername: items[2]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MenuButton<String>(
                      items: keys4,
                      itemBuilder: (String value) => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.sp),
                        child: Text(value),
                      ),
                      toggledChild:
                          MenuButtonContainer(containername: items[3]),
                      onItemSelected: (String value) {
                        setState(() {
                          items[3] = value;
                        });
                      },
                      child: MenuButtonContainer(containername: items[3]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: const CarouselWithIndicatorDemo(),
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
  final String containername;
  const MenuButtonContainer({Key? key, required this.containername})
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
