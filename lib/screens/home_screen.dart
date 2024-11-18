import 'package:digicala_test1/bloc/home/home_bloc.dart';
import 'package:digicala_test1/bloc/home/home_event.dart';
import 'package:digicala_test1/bloc/home/home_state.dart';
import 'package:digicala_test1/data/model/banner.dart';
import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:digicala_test1/widgets/banner_slider.dart';
import 'package:digicala_test1/widgets/category_item_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitializeDeta());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is HomeLodingState) ...[
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ))
              ],
              _getSearchBox(),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              if (state is HomeRequestSccessState) ...[
                state.bannerList.fold(
                  (exceptionMessege) {
                    return SliverToBoxAdapter(child: Text(exceptionMessege));
                  },
                  (listBanners) {
                    return _getBannes(listBanners);
                  },
                )
              ],
              _getCategoryListTitle(),
              if (state is HomeRequestSccessState) ...[
                state.categoryList.fold(
                  (exceptionMessege) {
                    return SliverToBoxAdapter(child: Text(exceptionMessege));
                  },
                  (categoryList) {
                    return _getCategoryList(categoryList);
                  },
                )
              ],
              _getBestSellerTitle(),
              _getBestSellerPrioducts(),
              _getMostViewedTitle(),
              _getMostViewedProducts(),
            ],
          );
        },
      )),
    );
  }
}

// ignore: camel_case_types
class _getMostViewedProducts extends StatelessWidget {
  const _getMostViewedProducts({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                child: Container(
                  width: 160,
                  height: 216,
                  decoration: BoxDecoration(
                    color: AppColors.background,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class _getMostViewedTitle extends StatelessWidget {
  const _getMostViewedTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 32),
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
              ('پر بازدید ترین ها'),
              style: const TextStyle(
                fontFamily: 'SB',
                color: AppColors.background,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _getBestSellerPrioducts extends StatelessWidget {
  const _getBestSellerPrioducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                child: Container(
                  width: 160,
                  height: 216,
                  decoration: BoxDecoration(
                    color: AppColors.background,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class _getBestSellerTitle extends StatelessWidget {
  const _getBestSellerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
        child: Row(
          children: [
            const Text(
              'پرفروش ترین‌ ها',
              style: TextStyle(
                  fontFamily: 'sb', fontSize: 12, color: AppColors.greyApp),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(fontFamily: 'sb', color: AppColors.blueApp),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class _getCategoryList extends StatelessWidget {
  List<Category1> listCategory;
  _getCategoryList(
    this.listCategory, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, top: 10),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listCategory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20),
                child: CategoryItemChip(listCategory[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _getCategoryListTitle extends StatelessWidget {
  const _getCategoryListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'دسته بندی',
              style: TextStyle(fontFamily: 'SB', color: AppColors.blueApp),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _getBannes extends StatelessWidget {
  List<BannerCampain> bannerCampain;
  _getBannes(
    this.bannerCampain, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(bannerCampain),
    );
  }
}

class _getSearchBox extends StatelessWidget {
  const _getSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}
