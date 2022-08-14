import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hookah_search/themes.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../mainMenu/mainMenuLogic.dart';

class Galary extends StatefulWidget {
  const Galary({Key? key, required this.id}) : super(key: key);
  final int? id;
  @override
  State<Galary> createState() => _GalaryState();
}

class _GalaryState extends State<Galary> {
  final _stream = InfoTextLogic();
  int activeIndex = 0;
  void setId(BuildContext context) {
    _stream.id = widget.id;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setId(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
      ),
      child: StreamBuilder<List<String>?>(
        stream: _stream.streamImgHookah,
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            return ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.all(
                Radius.circular(17.0),
              ),
              child: CarouselSlider.builder(
                itemCount: snapshot.data?.length,
                options: CarouselOptions(
                  initialPage: 0,
                  height: 44.3.h,
                  viewportFraction: 0.18.h,
                ),
                itemBuilder: (context, index, realIndex) {
                  final urlImage = snapshot.data?[index];
                  return buildImage(urlImage, index);
                },
              ),
            );
          } else {
            return const ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.all(
                Radius.circular(17.0),
              ),
              child: ErrorScreen(
                title:
                    'Упс... Кажется, данная кальянная не предоставила фотографии...',
                onTap: false,
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildImage(String? urlImage, int index) => ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.all(
          Radius.circular(17.0),
        ),
        child: Image.asset(urlImage!),
      );
}

class NameHookah extends StatefulWidget {
  const NameHookah({Key? key, required this.id}) : super(key: key);
  final int? id;

  @override
  State<NameHookah> createState() => _NameHookahState();
}

class _NameHookahState extends State<NameHookah> {
  final _stream = InfoTextLogic();

  void setId(BuildContext context) {
    _stream.id = widget.id;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setId(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 5.h,
      margin: const EdgeInsets.only(top: 5),
      color: Theme.of(context).primaryColor,
      child: StreamBuilder<String?>(
        stream: _stream.streamNameHookah,
        builder: (context, snapshot) {
          return Text(
            '${snapshot.data}'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 3.5.h,
            ),
          );
        },
      ),
    );
  }
}

class AllInfo extends StatefulWidget {
  const AllInfo({Key? key, required this.id}) : super(key: key);
  final int? id;
  @override
  State<AllInfo> createState() => _AllInfoState();
}

class _AllInfoState extends State<AllInfo> {
  final _stream = InfoTextLogic();

  void setId(BuildContext context) {
    _stream.id = widget.id;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setId(context));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView(
          children: [
            StreamBuilder<String?>(
              stream: _stream.streamDescription,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 2.2.h),
                );
              },
            ),
            Row(
              children: [
                SizedBox(
                  width: 91.0,
                  child: Text(
                    'Оценка',
                    style: TextStyle(fontSize: 2.2.h),
                  ),
                ),
                StreamBuilder<double?>(
                  stream: _stream.streamRating,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Container(
                        margin: const EdgeInsets.only(left: 15.0, top: 10.0),
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
                      return Container(
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
                  SizedBox(
                    width: 91.0,
                    child: Text(
                      'Адрес',
                      style: TextStyle(fontSize: 2.2.h),
                    ),
                  ),
                  StreamBuilder<String?>(
                    stream: _stream.streamAdress,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              '${snapshot.data}',
                              style: TextStyle(fontSize: 2.2.h),
                            ),
                          ),
                        );
                      } else {
                        return Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              '',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
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
                  Flexible(
                    child: SizedBox(
                      width: 91.0,
                      child: Text(
                        'Номер телефона',
                        style: TextStyle(fontSize: 2.2.h),
                      ),
                    ),
                  ),
                  StreamBuilder<String?>(
                    stream: _stream.streamPhoneNumb,
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
                              style: TextStyle(fontSize: 2.2.h),
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
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 91.0,
                    child: Text(
                      'Соц. сети',
                      style: TextStyle(fontSize: 2.2.h),
                    ),
                  ),
                  StreamBuilder<String?>(
                    stream: _stream.streamSocial,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: InkWell(
                            onTap: () async {
                              final url = Uri.parse('https://${snapshot.data}');

                              if (!await launchUrl(url)) {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              '${snapshot.data}',
                              style: TextStyle(fontSize: 2.2.h),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: const Text(
                            '',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 25),
              child: Text(
                '©hookahsearch 2022'.toUpperCase(),
                style: TextStyle(fontSize: 2.5.h, color: HexColor('#D4D4D4')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final bool onTap;

  @override
  Widget build(BuildContext context) {
    return (onTap
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: Scaffold(
              body: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/error.gif',
                        width: 20.h,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 2.0.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: Scaffold(
              body: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/error.gif',
                        width: 20.h,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 2.0.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
  }
}
