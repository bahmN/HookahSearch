import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hookah_search/mainMenu/mainMenuComponents.dart';
import 'package:hookah_search/mainMenu/mainMenuLogic.dart';
import 'package:hookah_search/themes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../infoMenu/infoMenuScreen.dart';

class AppBarMenu extends StatefulWidget {
  const AppBarMenu({Key? key, required this.icon, required this.func})
      : super(key: key);
  final Icon icon;
  final Function func;
  @override
  State<AppBarMenu> createState() => _AppBarMenuState();
}

class _AppBarMenuState extends State<AppBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5.h,
      margin: EdgeInsets.only(top: 5, right: 5.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.func();
              });
            },
            icon: widget.icon,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/logoHS.png',
              width: 20.h,
              height: 3.h,
            ),
          ),
          /*
          for a future user-account
          Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: _blackColor,
              child: Icon(
                Icons.person_sharp,
                color: HexColor('#FF727272'),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}

class InfoHookah extends StatefulWidget {
  const InfoHookah({Key? key, required this.id, required this.getStream})
      : super(key: key);
  final int? id;
  final InfoTextLogic getStream;
  @override
  State<InfoHookah> createState() => _InfoHookahState();
}

class _InfoHookahState extends State<InfoHookah> {
  void setId(BuildContext context) {
    widget.getStream.id = widget.id;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setId(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 15.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 77.0,
                child: Text(
                  'Оценка',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              StreamBuilder<double?>(
                stream: widget.getStream.streamRating,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: RatingBarIndicator(
                        rating: snapshot.data ?? 0.0,
                        itemSize: 3.h,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 3.h,
                    );
                  }
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 77.0,
                  child: Text(
                    'Адрес',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                StreamBuilder<String?>(
                  stream: widget.getStream.streamAdress,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Flexible(
                        child: Container(
                          height: 7.0.h,
                          margin: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            '${snapshot.data}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: const Text('', style: TextStyle(fontSize: 16.0)),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                  child: SizedBox(
                    width: 77.0,
                    child: Text(
                      'Номер телефона',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                StreamBuilder<String?>(
                  stream: widget.getStream.streamPhoneNumb,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: InkWell(
                          onTap: () {
                            FlutterPhoneDirectCaller.callNumber(
                                '${snapshot.data}');
                          },
                          child: Text(
                            '${snapshot.data}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: const Text(''),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const ButtonInfo(),
        ],
      ),
    );
  }
}

int? idForInfo;

class HookahMap extends StatefulWidget {
  const HookahMap({Key? key}) : super(key: key);

  @override
  State<HookahMap> createState() => _HookahMapState();
}

class _HookahMapState extends State<HookahMap> {
  final _stream = InfoTextLogic();
  bool hideInfo = true;

  void _getId(var id) {
    _stream.id = id;
    idForInfo = id;
  }

  @override
  void dispose() {
    _stream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = hideInfo ? 90.52.h : 60.h;

    return (hideInfo
        ? Column(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutCirc,
                height: height,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: GoogleMap(
                    onTap: (argument) => _getId(null),
                    trafficEnabled: true,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(56.631600, 47.886176), zoom: 12.0),
                    mapToolbarEnabled: false,
                    markers: {
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[0].toString()),
                        position: GoogleMapsComponents.position[0],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[0]),
                        onTap: () {
                          _getId(0);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[1].toString()),
                        position: GoogleMapsComponents.position[1],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[1]),
                        onTap: () {
                          _getId(1);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[2].toString()),
                        position: GoogleMapsComponents.position[2],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[2]),
                        onTap: () {
                          _getId(2);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[3].toString()),
                        position: GoogleMapsComponents.position[3],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[3]),
                        onTap: () {
                          _getId(3);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[4].toString()),
                        position: GoogleMapsComponents.position[4],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[4]),
                        onTap: () {
                          _getId(4);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[5].toString()),
                        position: GoogleMapsComponents.position[5],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[5]),
                        onTap: () {
                          _getId(5);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[6].toString()),
                        position: GoogleMapsComponents.position[6],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[6]),
                        onTap: () {
                          _getId(6);
                          setState(() {
                            hideInfo = !hideInfo;
                          });
                        },
                      ),
                    },
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutCirc,
                height: height,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: GoogleMap(
                    onTap: (argument) {
                      _getId(null);
                      setState(() {
                        hideInfo = !hideInfo;
                      });
                    },
                    trafficEnabled: true,
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(56.631600, 47.886176), zoom: 12.0),
                    mapToolbarEnabled: false,
                    markers: {
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[0].toString()),
                        position: GoogleMapsComponents.position[0],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[0]),
                        onTap: () => _getId(0),
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[1].toString()),
                        position: GoogleMapsComponents.position[1],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[1]),
                        onTap: () => _getId(1),
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[2].toString()),
                        position: GoogleMapsComponents.position[2],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[2]),
                        onTap: () => _getId(2),
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[3].toString()),
                        position: GoogleMapsComponents.position[3],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[3]),
                        onTap: () => _getId(3),
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[4].toString()),
                        position: GoogleMapsComponents.position[4],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[4]),
                        onTap: () => _getId(4),
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[5].toString()),
                        position: GoogleMapsComponents.position[5],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[5]),
                        onTap: () => _getId(5),
                      ),
                      Marker(
                        markerId: MarkerId(
                            GoogleMapsComponents.markerId[6].toString()),
                        position: GoogleMapsComponents.position[6],
                        infoWindow: InfoWindow(
                            title: GoogleMapsComponents.infoWidowTitle[6]),
                        onTap: () => _getId(6),
                      ),
                    },
                  ),
                ),
              ),
              InfoHookah(
                id: idForInfo,
                getStream: _stream,
              ),
            ],
          ));
  }
}

class ButtonsMap extends StatefulWidget {
  const ButtonsMap({Key? key, required this.icon}) : super(key: key);
  final Icon icon;
  @override
  State<ButtonsMap> createState() => _ButtonsMapState();
}

class _ButtonsMapState extends State<ButtonsMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 56.h),
      width: 7.h,
      height: 4.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        child: widget.icon,
      ),
    );
  }
}

class ButtonInfo extends StatefulWidget {
  const ButtonInfo({Key? key}) : super(key: key);
  @override
  State<ButtonInfo> createState() => ButtonInfoState();
}

class ButtonInfoState extends State<ButtonInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      margin: EdgeInsets.only(top: 3.7.h),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              duration: const Duration(milliseconds: 350),
              child: InfoScreen(id: idForInfo),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          fixedSize: Size(30.h, 4.h),
          textStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
          primary: Theme.of(context).primaryColor,
        ),
        child: Text('Информация'.toUpperCase()),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawer();
}

class _CustomDrawer extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logoHS.png'),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Главная',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 250),
                          child: const AboutUs(),
                        ),
                      );
                    },
                    child: const Text(
                      'О нас',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '©HOOKAHSEARCH 2022'.toUpperCase(),
                style: TextStyle(
                  fontSize: 2.5.h,
                  color: HexColor('#D4D4D4'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logoHS2.png',
                      width: 20.h,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'HOOKAH SERACH - Это продукт для поиска и бронирования лучших кальянных твоего города. Теперь тебе не придется заходить в карты и искать нужное место для того, чтобы хорошо провести время, потому что в Hookah Search стоит лишь выбрать понравившуюся кальянную и забронировать себе место!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 2.0.h),
                      ),
                    ),
                    Container(
                      height: 4.h,
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          fixedSize: Size(double.infinity, 4.h),
                          textStyle:
                              TextStyle(fontSize: 2.5.h, color: Colors.white),
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: Text('Вернуться назад'.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Версия приложения 0.9-b',
                      style: TextStyle(fontSize: 2.0.h),
                    ),
                    Text(
                      '©hookahsearch 2022'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 2.5.h, color: HexColor('#D4D4D4')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
