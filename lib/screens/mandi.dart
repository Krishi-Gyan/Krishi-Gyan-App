import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krishi_gyan/constants/colors.dart';
import 'package:krishi_gyan/widgets/cards.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';


//
//
//
enum WidgetMake { buy, sell }
//
class Mandi extends StatefulWidget {
  const Mandi({Key? key}) : super(key: key);
  @override
  State<Mandi> createState() => _MandiState();
}

class _MandiState extends State<Mandi> {

  WidgetMake b = WidgetMake.buy;
  MapController _mapController = MapController();
  MapOptions _mapOptions = MapOptions();
  Position? position;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if(!serviceEnabled){
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

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position _position) {
      setState(() {
        position = _position;
      });
    });
      _onLocationChanged(_position);
  }
    void _onLocationChanged(Position _position) {
      _mapController.move(
        LatLng(_position!.latitude, _position!.longitude),
        19,);
      _mapOptions = MapOptions(
        center: LatLng(_position!.latitude, _position!.longitude),
        zoom: _mapController.zoom,
      );
    }
    void initState() {
      super.initState();
      _determinePosition();
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
            subdomains: ['a', 'b', 'c'],
            maxZoom: 25,
          ),
          MarkerLayer(
            markers: position!=null ? [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(position!.latitude,position!.longitude),
                builder: (ctx) => Container(
                  child: Icon(Icons.location_on_sharp),
                ),
              ),
            ] : [],
          )
        ]
    );

    String datetime = DateTime.now().toString();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.45,
              width: size.width,
              decoration: const BoxDecoration(
                  color: darkGreen, //color
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: flutterMap,
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
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: lightGreen, //color
                  borderRadius: BorderRadius.all(Radius.circular(30))),
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
                        const SizedBox(
                          width: 100,
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
                    const SizedBox(
                      height: 10,
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
        return getsellform();
      default:
        return getsellform();
    }
  }

  Widget getsellform() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: darkGreen),
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.tree,
                color: darkGreen,
              ),
              title: TextFormField(
                // controller: passwordController,

                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'CROP',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: darkGreen),
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.moneyBill1Wave,
                color: darkGreen,
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
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: darkGreen),
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.weightScale,
                color: darkGreen,
              ),
              title: TextFormField(
                // controller: passwordController,

                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Yeild Amount',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 100,
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
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
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

    // @override
    // Widget build(BuildContext context) {
    //   FlutterMap flutterMap = FlutterMap(
    //     mapController: _mapController,
    //     options: _mapOptions,
    //     children: [
    //       TileLayer(
    //         urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    //         subdomains: ['a', 'b', 'c'],
    //         maxZoom: 19,
    //       ),
    //       MarkerLayer(
    //         markers: position!=null ? [
    //           Marker(
    //             width: 80.0,
    //             height: 80.0,
    //             point: LatLng(position!.latitude,position!.longitude),
    //             builder: (ctx) => Container(
    //               child: Icon(Icons.location_on_sharp),
    //             ),
    //           ),
    //         ] : [],
    //       )
    //    ]
    //     );
    //
    //   return Scaffold(
    //     body: flutterMap,
    //   );
    // }
// }


