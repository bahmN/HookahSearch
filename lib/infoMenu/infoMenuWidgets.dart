import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';
import '../mainMenu/mainMenuLogic.dart';

final _blackColor = ColorsLightTheme().blackColor;

class Galary extends StatefulWidget {
  const Galary({Key? key}) : super(key: key);

  @override
  State<Galary> createState() => _GalaryState();
}

class _GalaryState extends State<Galary> {
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
          color: _blackColor,
          width: 2.0,
        ),
      ),
    );
  }
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
      color: _blackColor,
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
                            color: _blackColor,
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
                        return Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: InkWell(
                              onTap: null,
                              child: Text(
                                '${snapshot.data}',
                                style: TextStyle(fontSize: 2.2.h),
                              ),
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
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: ('PTMono')),
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
                  'Упс... Кажется, Вы не выбрали место где хотите отдохнуть... Нажмите на экран и выбирите на карте любую кальянную, чтобы узнать о ней информацию',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: _blackColor, fontSize: 2.0.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
