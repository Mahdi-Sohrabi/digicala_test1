import 'package:digicala_test1/bloc/product/product_bloc.dart';
import 'package:digicala_test1/data/model/product.dart';
import 'package:digicala_test1/screens/product_detail_screen.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:digicala_test1/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => ProductBloc(),
                    child: ProductDetailScreen(),
                  )));
        },
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
                  SizedBox(
                      height: 110,
                      width: 100,
                      child: CachedImage(imageUrl: product.thumbnail)),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          Image.asset('assets/images/active_fav_product.png'),
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
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        child: Text(
                          '${product.persent!.round().toString()} %',
                          style: AppStyles.customStyleFont,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text('تومان', style: AppStyles.customStyleFont),
                          const SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                product.price.toString(),
                                style: AppStyles.itemPric,
                              ),
                              Text(
                                product.realPrice.toString(),
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
    );
  }
}
