// ignore_for_file: non_constant_identifier_names

import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:digicala_test1/widgets/banner_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteApp,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Image.asset('assets/images/icon_apple_blue.png'),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.end,
                          'جستجوی محصولات',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'SB',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset('assets/images/icon_search.png'),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'دسته بندی',
                      style:
                          TextStyle(fontFamily: 'SB', color: AppColors.blueApp),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CategoryhorizontalItemList(),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _getRow('پر فروش ترین ها '),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ProductItem(),
                      );
                    },
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            SliverToBoxAdapter(
              child: _getRow('پر بازدید ترین ها'),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ProductItem(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRow(String string) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 32),
      child: Row(
        children: [
          Image.asset('assets/images/icon_left_categroy.png'),
          const SizedBox(width: 10),
          const Text(
            'مشاهده همه',
            style: TextStyle(fontFamily: 'SB', color: AppColors.blueApp),
          ),
          const Spacer(),
          Text(
            string,
            style: const TextStyle(
              fontFamily: 'SB',
              color: AppColors.background,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget ProductItem() {
    return Container(
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
                  child: Image.asset('assets/images/active_fav_product.png'),
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
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
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
                      const Text('تومان', style: AppStyles.customStyleFont),
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
    );
  }

  Widget CategoryhorizontalItemList() {
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
