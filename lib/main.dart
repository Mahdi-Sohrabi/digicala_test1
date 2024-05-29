import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.whiteApp,
        body: SafeArea(
          child: Center(
            child: Container(
              width: 160,
              height: 216,
              decoration: BoxDecoration(
                color: AppColors.whiteApp,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(width: double.infinity),
                      Image.asset('assets/images/iphone.png'),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(
                              'assets/images/active_fav_product.png'),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.redApp,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 1),
                            child: Text(
                              '%3',
                              style: AppStyles.customStyleFont,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'آیفون 13 پرومکس',
                        style: AppStyles.itemGrouping,
                      ),
                      // SizedBox(height: 10),
                      Container(
                        height: 53,
                        decoration: const BoxDecoration(
                          color: AppColors.blueApp,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blueApp,
                              blurRadius: 25,
                              spreadRadius: -12,
                              offset: Offset(0.0, 15),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text('تومان',
                                  style: AppStyles.customStyleFont),
                              const SizedBox(width: 5),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '49,500,000',
                                    style: AppStyles.itemPric,
                                  ),
                                  Text(
                                    '48,800,000',
                                    style: AppStyles.itemNewPric,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 25,
                                child: Image.asset(
                                    'assets/images/icon_right_arrow_cricle.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column CategoryhorizontalItemList() {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 56,
              height: 56,
              //ShapeDecoration.....This for container Squircle(circle,Square)
              decoration: ShapeDecoration(
                color: Colors.amber,
                //Tihs For Shadow Under container
                shadows: const [
                  BoxShadow(
                    color: Colors.amber,
                    //This For Size Shadow
                    blurRadius: 25,
                    //This For Shadow Power
                    spreadRadius: -12,
                    //This For Shadow To horizontal and vertical
                    offset: Offset(0.0, 15),
                  ),
                ],
                //This required Proprty For widget ShapeDecoration
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const Icon(
              Icons.mouse,
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'همه',
          style: AppStyles.itemGrouping,
        )
      ],
    );
  }
}
