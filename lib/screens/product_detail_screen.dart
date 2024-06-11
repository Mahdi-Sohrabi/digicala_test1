import 'dart:ui';

import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Image.asset('assets/images/icon_apple_blue.png'),
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          'آیفون',
                          style: TextStyle(
                            color: AppColors.blueApp,
                            fontFamily: 'SB',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Image.asset('assets/images/icon_back.png'),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 32, bottom: 20),
                child: Text(
                  'آیفون اس 22 ایکس',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sb',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Container(
                  height: 284,
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 15,
                            right: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              Image.asset('assets/images/icon_star.png'),
                              const SizedBox(width: 5),
                              const Text(
                                '4.6',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'sm',
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: double.infinity,
                                child: Image.asset(
                                  'assets/images/iphone.png',
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                  'assets/images/icon_favorite_deactive.png'),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 44, right: 44),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 70,
                                height: 70,
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.greyApp),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child:
                                      Image.asset('assets/images/iphone.png'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'انتخاب رنگ',
                      style: TextStyle(fontFamily: 'sm', fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: AppColors.redApp,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: AppColors.redApp,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: AppColors.redApp,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'انتخاب حافطه داخلی',
                      style: TextStyle(fontFamily: 'sm', fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            border:
                                Border.all(width: 1, color: AppColors.greyApp),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                '128',
                                style:
                                    TextStyle(fontFamily: 'sm', fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            border:
                                Border.all(width: 1, color: AppColors.greyApp),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                '256',
                                style:
                                    TextStyle(fontFamily: 'sm', fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            border:
                                Border.all(width: 1, color: AppColors.greyApp),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                '512',
                                style:
                                    TextStyle(fontFamily: 'sm', fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 44, left: 44, top: 24),
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(width: 1, color: AppColors.greyApp),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset('assets/images/icon_left_categroy.png'),
                    const SizedBox(width: 10),
                    const Text(
                      'مشاهده',
                      style: TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                        color: AppColors.blueApp,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      ':مشخصات فنی',
                      style: TextStyle(
                        fontFamily: 'sm',
                        fontSize: 12,
                        color: AppColors.darkApp,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 44, left: 44, top: 24),
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(width: 1, color: AppColors.greyApp),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset('assets/images/icon_left_categroy.png'),
                    const SizedBox(width: 10),
                    const Text(
                      'مشاهده',
                      style: TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                        color: AppColors.blueApp,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      ':توضیحات محصول',
                      style: TextStyle(
                        fontFamily: 'sm',
                        fontSize: 12,
                        color: AppColors.darkApp,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(right: 44, left: 44, top: 24),
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(width: 1, color: AppColors.greyApp),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset('assets/images/icon_left_categroy.png'),
                    const SizedBox(width: 10),
                    const Text(
                      'مشاهده',
                      style: TextStyle(
                        fontFamily: 'sb',
                        fontSize: 12,
                        color: AppColors.blueApp,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 25,
                      width: 40,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 26,
                              height: 26,
                              decoration: const BoxDecoration(
                                color: AppColors.blueApp,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 15,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 26,
                              height: 26,
                              decoration: const BoxDecoration(
                                color: AppColors.redApp,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 26,
                              height: 26,
                              decoration: const BoxDecoration(
                                color: AppColors.greenApp,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 45,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 26,
                              height: 26,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 60,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 26,
                              height: 26,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '+10',
                                  style: TextStyle(
                                    fontFamily: 'sb',
                                    fontSize: 12,
                                    color: AppColors.whiteApp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      ':نظرات کاربران',
                      style: TextStyle(
                        fontFamily: 'sm',
                        fontSize: 12,
                        color: AppColors.darkApp,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: 44, left: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceTagButton(),
                    AddToBasketButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,
          decoration: BoxDecoration(
            color: AppColors.blueApp,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 53,
              width: 160,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Center(
                child: Text(
                  'افزودن به سبد خرید',
                  style: TextStyle(
                    fontFamily: 'sb',
                    color: AppColors.whiteApp,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,
          decoration: BoxDecoration(
            color: AppColors.greenApp,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 53,
              width: 160,
              decoration: const BoxDecoration(
                color: Colors.transparent,
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
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.redApp,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: Text(
                          '%3',
                          style: AppStyles.customStyleFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
