import 'package:digicala_test1/bloc/home/home_bloc.dart';
import 'package:digicala_test1/bloc/home/home_event.dart';
import 'package:digicala_test1/bloc/home/home_state.dart';
import 'package:digicala_test1/data/model/banner.dart';
import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/data/model/product.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/widgets/banner_slider.dart';
import 'package:digicala_test1/widgets/category_item_chip.dart';
import 'package:digicala_test1/widgets/product_item.dart';
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
      backgroundColor: AppColors.whiteApp,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is HomeLodingState) ...{
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                } else ...{
                  _getSearchBox(),
                  SliverToBoxAdapter(child: SizedBox(height: 15)),
                  if (state is HomeRequestSccessState) ...[
                    state.bannerList.fold(
                      (exceptionMessege) {
                        return SliverToBoxAdapter(
                            child: Text(exceptionMessege));
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
                        return SliverToBoxAdapter(
                            child: Text(exceptionMessege));
                      },
                      (categoryList) {
                        return _getCategoryList(categoryList);
                      },
                    )
                  ],
                  const _getBestSellerTitle(),
                  if (state is HomeRequestSccessState) ...[
                    state.bestSellerProductList.fold(
                      (exceptionMessege) {
                        return SliverToBoxAdapter(
                            child: Text(exceptionMessege));
                      },
                      (productList) {
                        return _getBestSellerPrioducts(productList);
                      },
                    )
                  ],
                  const _getMostViewedTitle(),
                  if (state is HomeRequestSccessState) ...[
                    state.hotestProductList.fold(
                      (exceptionMessege) {
                        return SliverToBoxAdapter(
                            child: Text(exceptionMessege));
                      },
                      (productList) {
                        return _getMostViewedProducts(productList);
                      },
                    ),
                  ],
                },
              ],
            );
          },
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _getMostViewedProducts extends StatelessWidget {
  List<Product> productList;
  _getMostViewedProducts(
    this.productList, {
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
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ProductItem(productList[index]),
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
            const EdgeInsets.only(left: 20, right: 40, bottom: 15, top: 35),
        child: Row(
          children: [
            Text(('پر بازدید ترین ها'),
                style: const TextStyle(
                    fontFamily: 'SB', color: AppColors.greyApp, fontSize: 12)),
            const Spacer(),
            const Text('مشاهده همه',
                style: TextStyle(fontFamily: 'SB', color: AppColors.blueApp)),
            const SizedBox(width: 10),
            Image.asset('assets/images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class _getBestSellerPrioducts extends StatelessWidget {
  List<Product> productList;
  _getBestSellerPrioducts(
    this.productList, {
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
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(productList[index]);
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
        padding:
            const EdgeInsets.only(left: 20, right: 44, bottom: 15, top: 15),
        child: Row(
          children: [
            const Text('پرفروش ترین‌ ها',
                style: TextStyle(
                    fontFamily: 'sb', fontSize: 12, color: AppColors.greyApp)),
            const Spacer(),
            const Text('مشاهده همه',
                style: TextStyle(fontFamily: 'sb', color: AppColors.blueApp)),
            const SizedBox(width: 10),
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
        padding: const EdgeInsets.only(
          right: 20,
          top: 10,
        ),
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
        padding: EdgeInsets.only(right: 30, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
              Image.asset('assets/images/icon_search.png'),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  'جستجوی محصولات',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontFamily: 'SB',
                    fontSize: 16,
                  ),
                ),
              ),
              Image.asset('assets/images/icon_apple_blue.png'),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
