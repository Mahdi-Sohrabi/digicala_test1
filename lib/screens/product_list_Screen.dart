// ignore_for_file: file_names

import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          'پر فروش ترین ها',
                          style: TextStyle(
                            color: AppColors.blueApp,
                            fontFamily: 'SB',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductItem(),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.4,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
              ),
            )
          ],
        ),
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
}
