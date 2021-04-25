import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/source/skate_local_data_souce.dart';
import '../../providers/providers.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutSkateBoard(),
    );
  }
}

class LayoutSkateBoard extends StatefulWidget {
  const LayoutSkateBoard({
    Key key,
  }) : super(key: key);

  @override
  _LayoutSkateBoardState createState() => _LayoutSkateBoardState();
}

class _LayoutSkateBoardState extends State<LayoutSkateBoard> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(listener);
    super.initState();
  }

  void listener() {
    context.read(offsetNotifier).updatePage(_pageController.page);
  }

  @override
  void dispose() {
    _pageController.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (_, watch, child) {
            final modelI = watch(indexNotifier);

            return PageView(
              onPageChanged: (i) => modelI.index = i,
              controller: _pageController,
              children: [
                SamuraiWidget(),
                HopeSakateboardWidget(),
                FolkloreSkateBoard(),
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomNavBar(),
        )
      ],
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              size: 25.sp,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 25.sp,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              size: 25.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 15.0,
          )
        ],
      ),
    );
  }
}

class FolkloreSkateBoard extends StatelessWidget {
  const FolkloreSkateBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child) {
        final model = watch(offsetNotifier);
        var clamp = (model.page - 2).abs();
        var opacity = (model.page - 1).clamp(0, 1.0);
        return Stack(
          children: [
            Transform.scale(
              scale: math.max(0, 1 - clamp),
              child: Opacity(
                opacity: math.max(
                  0,
                  math.max(0, 1 - clamp),
                ),
                child: Center(
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Transform.rotate(
                angle: math.max(0, (math.pi / 3) * 4 * clamp),
                child: Image.asset(skates[2].path),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: model.page * 50.h,
              left: ScreenUtil().screenWidth / 8,
              child: Text(
                skates[2].title,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: opacity.toDouble(),
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ).copyWith(bottom: 100.h),
                child: Text(
                  skates[2].details,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HopeSakateboardWidget extends StatelessWidget {
  const HopeSakateboardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child) {
        final model = watch(offsetNotifier);
        var clamp = (model.page - 1).abs();
        var opacity = model.page.clamp(0, 1.0);
        return Stack(
          children: [
            Transform.scale(
              scale: math.max(0, 1 - clamp),
              child: Opacity(
                opacity: math.max(
                  0,
                  math.max(0, 1 - clamp),
                ),
                child: Center(
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Transform.rotate(
                angle: math.max(0, (math.pi / 3) * 4 * clamp),
                child: Image.asset(
                  skates[1].path,
                  height: 350.h,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: model.page * 80.h,
              left: ScreenUtil().screenWidth / 5,
              child: Text(
                skates[1].title,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: opacity,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ).copyWith(bottom: 100.h),
                child: Text(
                  skates[1].details,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.withOpacity(0.6),
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SamuraiWidget extends StatelessWidget {
  const SamuraiWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (_, watch, child) {
            final model = watch(offsetNotifier);

            return Stack(
              children: [
                Transform.scale(
                  scale: math.max(0, 1 - model.page),
                  child: Opacity(
                    opacity: math.max(
                      0,
                      math.max(0, 1 - model.page),
                    ),
                    child: Center(
                      child: Container(
                        height: 200.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Transform.rotate(
                    angle: math.max(0, (math.pi / 3) * 4 * model.page),
                    child: Image.asset(skates[0].path),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  top: 80.h * (model.page + 1).abs(),
                  left: ScreenUtil().screenWidth / 9,
                  child: Text(
                    skates[0].title,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: model.page == 0 ? 1 : 0,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ).copyWith(bottom: 100.h),
                    child: Text(
                      skates[1].details,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 15.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
