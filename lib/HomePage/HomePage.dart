import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:weekend_chef/Components/generic_loading_dialogbox.dart';

import 'package:weekend_chef/HomePage/models/home_data_model.dart';
import 'package:weekend_chef/SplashScreen/spalsh_screen.dart';
import 'package:weekend_chef/constants.dart';
import 'package:http/http.dart' as http;

Future<HomeDataModel> get_home_data(String lat, String lng) async {
  print('##################');
  print(lat);
  print(lng);
  var token = await getApiPref();
  var userId = await getUserIDPref();

  final response = await http.get(
    Uri.parse(
        "${hostName}api/homepage/client-homepage-data/?user_id=bpdx50b329cpe1g5f8w2rf6yd6owmvhrit&lat=$lat&lng=$lng"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      //'Authorization': 'Token ' + token.toString()
      'Authorization': 'Token dfb32ded6baee652c714d865485d8966f06d6eb0'
    },
  );
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);

    return HomeDataModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return HomeDataModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return HomeDataModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return HomeDataModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401) {
    print(jsonDecode(response.body));
    return HomeDataModel.fromJson(jsonDecode(response.body));
  } else {
    //throw Exception('Failed to load data');
    print(jsonDecode(response.body));
    return HomeDataModel.fromJson(jsonDecode(response.body));
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;
  int _selectedIndex = 0;
  Future<HomeDataModel>? _futureHomeData;

  // Example tab data where each tab contains 'image', 'text', and 'content'
  final List<Map<String, dynamic>> tabs = [
    {
      'image': 'assets/images/banku.png',
      'text': 'Swallows',
      'content': 'Banku',
      'photo': 'assets/images/banku2.png',
    },
    {
      'image': 'assets/images/Mask group.png',
      'text': 'Soup',
      'content': 'Chicken Soup',
      'photo': 'assets/images/soup2.png',
    },
    {
      'image': 'assets/images/stew.png',
      'text': 'Stews',
      'content': 'Goat Stew',
      'photo': 'assets/images/stew2.png',
    },
    {
      'image': 'assets/images/Porridge.png',
      'text': 'Porridge',
      'content': 'Hausa Koko',
      'photo': 'assets/images/Porridge2.png',
    },
    {
      'image': 'assets/images/grains.png',
      'text': 'Grains',
      'content': 'Waakye',
      'photo': 'assets/images/grains2.png',
    },
    {
      'image': 'assets/images/banku.png',
      'text': 'Swallows',
      'content': 'Banku',
      'photo': 'assets/images/banku2.png',
    },
    {
      'image': 'assets/images/Mask group.png',
      'text': 'Soup',
      'content': 'Chicken Soup',
      'photo': 'assets/images/soup2.png',
    },
    {
      'image': 'assets/images/stew.png',
      'text': 'Stews',
      'content': 'Goat Stew',
      'photo': 'assets/images/stew2.png',
    },
    {
      'image': 'assets/images/Porridge.png',
      'text': 'Porridge',
      'content': 'Hausa Koko',
      'photo': 'assets/images/Porridge2.png',
    },
    {
      'image': 'assets/images/grains.png',
      'text': 'Grains',
      'content': 'Waakye',
      'photo': 'assets/images/grains2.png',
    },
  ];

  // Function to get the content of the selected tab
  Widget getTabContent(int index, List<Dishes>? dishes) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 1.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: dishes!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
/*                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DishDetailsWidget())); */
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        5.0, 5.0, 5.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(hostNameMedia +
                                              dishes[index]
                                                  .coverPhoto
                                                  .toString())
                                          .image,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 30.0,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(155, 0, 0, 0),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        )),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        dishes[index].name.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          shadows: [
                                            Shadow(
                                              color: Colors.grey,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 85.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Ghc ',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF00B61D),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                              Text(
                                                dishes[index]
                                                    .basePrice
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'Inter Tight',
                                                  color: Color(0xFF00B61D),
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 3),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF94638),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0),
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Order Now',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Colors.white,
                                                  fontSize: 7.0,
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5.0, 0.0, 5.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  dishes[index]
                                                      .value
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily: 'Inter Tight',
                                                    color: Colors.grey,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (dishes[index].customizable ==
                                                true) ...[
                                              Container(
                                                decoration:
                                                    const BoxDecoration(),
                                                child: const Text(
                                                  'Customizable',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFFF94638),
                                                    fontSize: 9.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ),
                                            ]
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _futureHomeData = get_home_data('5.6037', '-0.1870');
  }

  @override
  Widget build(BuildContext context) {
    return (_futureHomeData == null) ? buildColumn() : buildFutureBuilder();
  }

  buildColumn() {
    return Scaffold(
      body: Container(),
    );
  }

  FutureBuilder<HomeDataModel> buildFutureBuilder() {
    return FutureBuilder<HomeDataModel>(
        future: _futureHomeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingDialogBox(
              text: 'Please Wait..',
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data!;

            var userData = data.data!.userData;
            var categories = data.data!.dishCategories!;
            var notification_count = data.data!.notificationCount!;

            if (data.message == "Successful") {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor: Colors.white,
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/weekend_logo2.png',
                                                  width: 66.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // Dynamic greeting based on time of day
                                                      DateTime.now().hour < 12
                                                          ? "Good Morning"
                                                          : DateTime.now()
                                                                      .hour <
                                                                  18
                                                              ? "Good Afternoon"
                                                              : "Good Evening",
                                                      style: const TextStyle(
                                                          //fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      userData!.firstName
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 21.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () {
/*                                                   Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const DishMapViewWidget())); */
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons.map,
                                                    color: Colors.black,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                   /*                Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const MyCartWidget())); */
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons.shopping_cart_sharp,
                                                    color: Colors.black,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .notification_important_outlined,
                                                      color: Colors.black,
                                                      size: 24.0,
                                                    ),
                                                    if (notification_count >
                                                        0) ...[
                                                      Positioned(
                                                        bottom: 0,
                                                        right: 0,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          radius: 5,
                                                        ),
                                                      )
                                                    ]
                                                  ],
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.search_sharp,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: Image.network(
                                                  hostNameMedia +
                                                      userData.photo.toString(),
                                                  width: 44.0,
                                                  height: 44.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  children: [
                                    // Custom Tab Bar
                                    Container(
                                      height:
                                          100, // Set the height of the TabBar
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: categories.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _selectedIndex = index;
                                              });
                                            },
                                            child: Container(
                                              //width: 100,
                                              //color: Colors.deepOrange,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              hostNameMedia +
                                                                  categories[
                                                                          index]
                                                                      .photo
                                                                      .toString()),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    categories[index]
                                                        .name
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: _selectedIndex ==
                                                              index
                                                          ? bookPrimary
                                                          : Colors.black,
                                                    ),
                                                  ),

                                                  Container(
                                                    width:
                                                        60, // Width of the indicator (can be same as tab)
                                                    height:
                                                        4, // Height of the indicator

                                                    decoration: BoxDecoration(
                                                      color: _selectedIndex ==
                                                              index
                                                          ? bookPrimary
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                  ) // Color of the indicator
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    Expanded(
                                      child: getTabContent(_selectedIndex,
                                          categories[_selectedIndex].dishes),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      customNavBar(context)
                    ],
                  ),
                ),
              );
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()));
              });
            }
          }

          return const LoadingDialogBox(
            text: 'Please Wait.!!!.',
          );
        });
  }

  Positioned customNavBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 13),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [bookPrimary, Colors.transparent], // Blue gradient effect
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          /*           boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  ),
                                ], */
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ), // Match the container's border radius
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 2.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors
                        .transparent, // Use transparent to let the gradient show
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.2), // Slightly transparent white background
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          print('Home tapped');
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/home.png",
                              height: 20,
                              color:
                                  bookPrimary, // Change color to contrast with blue
                            ),
                            const Text('Home',
                                style:
                                    TextStyle(fontSize: 9, color: bookPrimary))
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
      /*                     Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const MyOrdersWidget()),
                          ); */
                        },
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/icons/card.png",
                                  height: 20,
                                  color: Colors.white,
                                ),
                                const Text('My Orders',
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.explore, color: Colors.white),
                                Text('Transactions',
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/icons/message.png",
                                  height: 20,
                                  color: Colors.white,
                                ),
                                const Text('Settings',
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
        /*                   Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ClientProfilePageWidget()),
                          ); */
                        },
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/icons/person.png",
                                  height: 20,
                                  color: Colors.white,
                                ),
                                const Text('Profile',
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.white))
                              ],
                            ),
                          ],
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
