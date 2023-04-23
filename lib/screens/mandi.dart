import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krishi_gyan/constants/colors.dart';
import 'package:krishi_gyan/widgets/cards.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum WidgetMake { buy, sell }

//
class Mandi extends StatefulWidget {
  const Mandi({Key? key}) : super(key: key);
  @override
  State<Mandi> createState() => _MandiState();
}

class _MandiState extends State<Mandi> {
  WidgetMake b = WidgetMake.buy;
  final MapController _mapController = MapController();
  MapOptions _mapOptions = MapOptions();
  Position? position;
  String? add1;
  String? add2;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return;
      }
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    }
    Position _position = await Geolocator.getCurrentPosition();

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position _position) {
      setState(() {
        position = _position;
        getAddress(_position);
      });
    });
    _onLocationChanged(_position);
  }

  void _onLocationChanged(Position _position) {
    _mapController.move(
      LatLng(_position.latitude, _position.longitude),
      19,
    );
    _mapOptions = MapOptions(
      center: LatLng(_position.latitude, _position.longitude),
      zoom: _mapController.zoom,
    );
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
    //getAddress();
  }

  //  getaddress() async {
  //   // final coordinates = new Coordinates(position!.latitude, position!.longitude);
  //   // var address =
  //   //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //      position!.latitude.toDouble(), position!.longitude.toDouble());
  //   setState(() {
  //     add1 = placemarks.first.locality.toString();
  //     add2 = placemarks[0].toString();
  //   });
  // }
  Future<void> getAddress(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        add1 =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    // widgetmake s = widgetmake.sell;

    FlutterMap flutterMap = FlutterMap(
        mapController: _mapController,
        options: _mapOptions,
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
            maxZoom: 25,
          ),
          MarkerLayer(
            markers: position != null
                ? [
                    Marker(
                      width: 80.w,
                      height: 80.h,
                      point: LatLng(position!.latitude, position!.longitude),
                      builder: (ctx) => Container(
                        child: const Icon(Icons.location_on_sharp),
                      ),
                    ),
                  ]
                : [],
          )
        ]);

    String datetime = DateTime.now().toString();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(alignment: Alignment.center, children: <Widget>[
              Container(
                height: size.height * 0.45,
                width: size.width,
                decoration: const BoxDecoration(
                    color: darkGreen, //color
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),

                // child: Align(
                //   alignment: Alignment.centerLeft,
                //   child: Row(
                //     children: <Widget>[
                //       Text(
                //         datetime,
                //         textAlign: TextAlign.left,
                //       ),
                //       SizedBox(
                //         width: size.width * 0.4,
                //       ),
                //       const Icon(Icons.person)
                //     ],
                //   ),
                // ),
              ),
              Positioned(
                top: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    child: flutterMap,
                    height: 38.h,
                    width: 90.w,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                child: Text(add1 ?? "",
                    style: GoogleFonts.rajdhani(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 16))),
                top: 80,
                right: 35,
              ),
              // Positioned(
              //   child: Text("$position"),
              //   top: 100,
              //   left: 100,
              // ),
            ]),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: EdgeInsets.all(1.5.h),
              decoration: BoxDecoration(
                color: lightGreen, //color
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
                ),
              ),
              height: size.height * 0.5,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 0.9.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              b = WidgetMake.buy;
                            });
                          },
                          child: Text("Buy",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: (b == WidgetMake.buy)
                                      ? Colors.black
                                      : Colors.black54)),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              b = WidgetMake.sell;
                            });
                          },
                          child: Text(
                            "Sell",
                            style: TextStyle(
                                fontSize: 25,
                                color: (b == WidgetMake.sell)
                                    ? Colors.black
                                    : Colors.black54),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
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
    );
  }

  Widget getCustomContainer() {
    switch (b) {
      case WidgetMake.buy:
        return getbuycard();
      case WidgetMake.sell:
        return getSellForm(context);
      default:
        return getSellForm(context);
    }
  }

  Widget getSellForm(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: darkGreen),
          borderRadius: BorderRadius.circular(10.w),
          // image: const DecorationImage(
          //   image: AssetImage('assets/crop.png'),
          // ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('assets/crop.png'),
                  color: darkGreen,
                ),
              ],
            ),
            title: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Crop',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 2.h),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: darkGreen),
            borderRadius: BorderRadius.circular(10.w)),
        child: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                  FontAwesomeIcons.moneyBill1Wave,
                  color: darkGreen,
                ),
              ],
            ),
            title: TextFormField(
              // controller: passwordController,

              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Price',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 2.h),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: darkGreen),
            borderRadius: BorderRadius.circular(10.w)),
        child: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                  FontAwesomeIcons.weightScale,
                  color: darkGreen,
                ),
              ],
            ),
            title: TextFormField(
              // controller: passwordController,

              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Image',
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 40.w,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text(
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
            backgroundColor: darkGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget getbuycard() {
    return Column(
      children: const [
        MyCards(),
        MyCards(),
        MyCards(),
      ],
    );
  }
}
