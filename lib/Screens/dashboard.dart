import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackerkernel/Services/apiservice.dart';
import 'package:hackerkernel/Widgets/color.dart';
import 'package:hackerkernel/Widgets/images.dart';
import 'package:hackerkernel/Widgets/text.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.grid_view_rounded,
                color: ColorData.darkBlue,
                size: 35,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          backgroundColor: ColorData.primary,
          elevation: 0.0,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Home',
                  size: 20,
                  color: ColorData.secondary,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: ColorData.secondary,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.person,
                      size: 35,
                      color: ColorData.secondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 40.0, right: 20, top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Featured Articles',
                  color: ColorData.secondary,
                  size: 20,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 150.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: 150.0,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Image.asset(
                                  Images.image1,
                                  fit: BoxFit.fitHeight,
                                  scale: 2.0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  color: ColorData.darkBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AppText(
                                      '5 Minutes of daily yoga,Lifetime of Strength\n\n        Read Now',
                                      size: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                AppText(
                  'Featured Videos',
                  color: ColorData.secondary,
                  size: 20,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 210.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                Images.image2,
                                fit: BoxFit.fitWidth,
                                scale: 2.0,
                              ),
                              Container(
                                color: ColorData.darkBlue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AppText(
                                    '01:25:00',
                                    size: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.smart_display_outlined,
                                      color: ColorData.primary,
                                      size: 60,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: ColorData.primary,
                                        shape: BoxShape.circle),
                                    child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.star,
                                          color: ColorData.darkBlue,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorData.primary,
                ),
                child: Center(
                  child: AppText(
                    BaseApiService.email,
                    color: ColorData.darkBlue,
                    size: 20,
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(
                      Icons.logout_rounded,
                      size: 30,
                      color: ColorData.secondary,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    AppText(
                      'Logout',
                      color: ColorData.secondary,
                      size: 18,
                    ),
                  ],
                ),
                onTap: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
