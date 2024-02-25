import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:krishi_gyan/api.dart';
import 'package:krishi_gyan/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather/weather.dart';
import '../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class KrishiGyan extends StatefulWidget {
  const KrishiGyan({Key? key}) : super(key: key);

  @override
  State<KrishiGyan> createState() => _KrishiGyanState();
}

class _KrishiGyanState extends State<KrishiGyan> {
  final WeatherFactory _wf = WeatherFactory("1234");
  Weather? _weather;
  String city = "delhi";

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName(city).then((value) {
      setState(() {
        _weather = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Krishi Gyan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ),
          backgroundColor: darkGreen,
          toolbarHeight: size.height * 0.05,
          elevation: 0,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.sp),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _weather == null
                  ? const Center(
                      child: SizedBox(),
                    )
                  : Container(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Weather",
                                    style: TextStyle(
                                      color: greenTitle,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          _weather?.areaName ?? "",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        Text(
                                          _weather?.date != null
                                              ? DateFormat('EEEE, dd-MM-yy')
                                                  .format(_weather!.date!)
                                              : "",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    _weather?.temperature.toString() ?? "",
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontSize: 25.sp,
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
                                  Column(
                                    children: [
                                      Text(
                                        "Humidity",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        _weather?.humidity.toString() ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Wind Speed",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        _weather?.windSpeed.toString() ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Cloudiness",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        _weather?.cloudiness.toString() ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  "Krishi Gyan",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.w),
                height: size.height * 0.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.w),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Land Preparation\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'The wheat crop requires a well-pulverized but compact seed bed for good and uniform germination. Three or four ploughings in the summer, repeated harrowing in the rainy season, followed by three or four cultivations and planking immediately before sowing produce a good, firm seed bed for the dry crop on alluvial soils. For the irrigated crop, the land is given a pre-sowing irrigation (palewa or raund) and the number of ploughings is reduced. Where white ants or other pests are a problem, Aldrin 5% or BHC 10% dust at the rate of 25 kg/ha should be applied to the soil after the last ploughing or before planking.',
                                  style: GoogleFonts.inter(
                                      fontSize: 16.sp, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Application of Mannures and Fertilizer\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '''It is desirable that 2 to 3 tonnes of farmyard manure per hectare or some other organic matter is applied 5 or 6 weeks before sowing. The fertilizer requirement of the irrigated wheat crop are as follows:
With assured fertilizer supply:
Nitrogen (N) @8- - 120 kg/ha
Phosphorus (P2O5) @ 40- 60 kg/ha
Potash (K2O) @ 40 kg/ha.

Under fertilizer constraints:
N @ 60-80 kg/ha
P2O5 @ 30-40 kg/ha
K2O @ 20-25 kg/ha.''',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Interculture\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Generally weeding is done after 1 ½ to 2 months after sowing or weedicides like 2,4 D, Avadex or Nitrofen (Tok E-25) for controling Chenopodium sp, Angallis sp. Asphodelus sp. Phalaris sp. of weeds.',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Irrigation\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'The high yielding wheat varieties should be given five to six irrigations at their critical growth stages viz. Crown root initiation, tillering, jointing, flowering, milk and dough which come at 21-25 days after sowing (DAS), 45-60 DAS, 60-70 DAS, 90-95 DAS, 100-105 DAS and 120-125 DAS respectively. Off these irrigation at CRI stage is most important.',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Government Schemes",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: size.height * 0.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Agriculture Infrastructure Fund\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'The Union Cabinet in July 2020 has approved a new pan India Central Sector Scheme called Agriculture Infrastructure Fund (National Agriculture Infra Financing Facility). The scheme shall provide a medium - long term debt financing facility for investment in viable projects for post-harvest management Infrastructure and community farming assets through interest subvention and financial support.',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Animal Husbandry Infrastructure Development Fund\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'The Animal Husbandry Infrastructure Development Fund (AHIDF), implemented under Infrastructure Development Fund (IDF) with an outlay of Rs.29,610.25 crore is to be continued until 2025-26. \nThe scheme will incentivize investments for Dairy processing and product diversification, Meat processing and product diversification, Animal Feed Plant, Breed multiplication farm, Animal Waste to Wealth Management (Agri-waste management) and Veterinary vaccine and drug production facilities.',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Credit facility for farmers\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Loan facility is available through a large network of Commercial Banks, Regional Rural Banks and Cooperative Credit Institutions in the country to fulfill the crop loan and term loan needs of the farmers.',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Crop insurance schemes\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '''Four insurance schemes are being implemented namely by the government to support farmers.

                                      Pradhan Mantri Fasal Bima Yojana (PMFBY)
                                      Weather based Crop Insurance Scheme (WBCIS)
                                      Coconut Palm insurance scheme (CPIS) and
                                      Pilot Unified Package insurance scheme UPIS) (45 districts).''',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
