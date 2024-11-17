import 'package:digicala_test1/data/model/banner.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class BannerSlider extends StatelessWidget {
  List<BannerCampain> bannerList;
  BannerSlider(this.bannerList, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            //viewportFraction..... Form 0.1 to 1 , Size To Screen
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return CachedImage(
                imageUrl: bannerList[index].thumbnail,
              );
            },
          ),
        ),
        Positioned(
          bottom: 30,
          //SmoothPageIndicator.....this Widget For Indicator To Banner Slider
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            //effect.....Style For Indicator(Size,Type,Color,...)
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.white,
              activeDotColor: AppColors.blueApp,
            ),
          ),
        ),
      ],
    );
  }
}
