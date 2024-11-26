import 'dart:ui';
import 'package:digicala_test1/bloc/product/product_bloc.dart';
import 'package:digicala_test1/bloc/product/product_event.dart';
import 'package:digicala_test1/bloc/product/product_state.dart';
import 'package:digicala_test1/data/Repository/product_detail_repository.dart';
import 'package:digicala_test1/data/model/product_image.dart';
import 'package:digicala_test1/data/model/product_variant.dart';
import 'package:digicala_test1/data/model/variant.dart';
import 'package:digicala_test1/data/model/variant_type.dart';
import 'package:digicala_test1/di/di.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:digicala_test1/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductInitalizeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductDietailLoadingState) ...[
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, top: 20),
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
                if (state is ProductDietailResponseState) ...{
                  state.productImage.fold(
                    (exception) {
                      return SliverToBoxAdapter(
                        child: Text(exception),
                      );
                    },
                    (productImageList) {
                      return GalleryWidget(productImageList);
                    },
                  )
                },
                if (state is ProductDietailResponseState) ...{
                  state.productVariant.fold(
                    (exception) {
                      return SliverToBoxAdapter(
                        child: Text(exception),
                      );
                    },
                    (ProductVariantList) {
                      return VariantContainer(ProductVariantList);
                    },
                  )
                },
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 20, right: 44, left: 44),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         const Text(
                //           'انتخاب حافطه داخلی',
                //           style: TextStyle(fontFamily: 'sm', fontSize: 15),
                //         ),
                //         const SizedBox(height: 10),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             Container(
                //               margin: const EdgeInsets.only(left: 10),
                //               height: 25,
                //               decoration: BoxDecoration(
                //                 color: AppColors.background,
                //                 border: Border.all(
                //                     width: 1, color: AppColors.greyApp),
                //                 borderRadius: const BorderRadius.all(
                //                   Radius.circular(8),
                //                 ),
                //               ),
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 20),
                //                 child: Center(
                //                   child: Text(
                //                     '128',
                //                     style: TextStyle(
                //                         fontFamily: 'sm', fontSize: 12),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(left: 10),
                //               height: 25,
                //               decoration: BoxDecoration(
                //                 color: AppColors.background,
                //                 border: Border.all(
                //                     width: 1, color: AppColors.greyApp),
                //                 borderRadius: const BorderRadius.all(
                //                   Radius.circular(8),
                //                 ),
                //               ),
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 20),
                //                 child: Center(
                //                   child: Text(
                //                     '256',
                //                     style: TextStyle(
                //                         fontFamily: 'sm', fontSize: 12),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(left: 10),
                //               height: 25,
                //               decoration: BoxDecoration(
                //                 color: AppColors.background,
                //                 border: Border.all(
                //                     width: 1, color: AppColors.greyApp),
                //                 borderRadius: const BorderRadius.all(
                //                   Radius.circular(8),
                //                 ),
                //               ),
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 20),
                //                 child: Center(
                //                   child: Text(
                //                     '512',
                //                     style: TextStyle(
                //                         fontFamily: 'sm', fontSize: 12),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 40, right: 20, left: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PriceTagButton(),
                        SizedBox(height: 20),
                        AddToBasketButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class VariantContainer extends StatelessWidget {
  List<ProductVarint> productVariantList;
  VariantContainer(
    this.productVariantList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              productVariantList[0].variantType.title!,
              style: TextStyle(fontFamily: 'sm', fontSize: 15),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ..._buildColorVariantsOptions(productVariantList[0].variantList)
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildColorVariantsOptions(List<Variant> variantList) {
  List<Widget> colorWidgets = [];
  for (var colorVariant in variantList) {
    String categoryColor = '0xff${colorVariant.value}';

    int hexColor = int.parse(
      categoryColor,
    );

    var item = Container(
      margin: const EdgeInsets.only(left: 10),
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: Color(hexColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );

    colorWidgets.add(item);
  }

  return colorWidgets;
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productImageList;
  int celectedItem = 0;

  GalleryWidget(
    this.productImageList, {
    super.key,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                          height: 150,
                          child: CachedImage(
                            imageUrl: widget
                                .productImageList[widget.celectedItem].imageUrl,
                          )),
                      const Spacer(),
                      Image.asset('assets/images/icon_favorite_deactive.png'),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(left: 44, right: 44, top: 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productImageList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.celectedItem = index;
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: AppColors.greyApp),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: CachedImage(
                                imageUrl:
                                    widget.productImageList[index].imageUrl,
                              )),
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
        GestureDetector(
          onTap: () async {
            print(
                '///////////////////////////////////////////////////////////////////////');
            IDetailProductRepository repository = locator.get();
            var respons = await repository.getProductImage();
            respons.fold(
              (l) {
                print(l);
              },
              (r) {
                r.forEach(
                  (element) {
                    print(element.imageUrl);
                  },
                );
              },
            );
            print(
                '///////////////////////////////////////////////////////////////////////');
          },
          child: Container(
            height: 60,
            width: 140,
            decoration: BoxDecoration(
              color: AppColors.blueApp,
              borderRadius: BorderRadius.circular(15),
            ),
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
