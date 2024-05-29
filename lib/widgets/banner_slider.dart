import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

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
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 200,
                  color: Colors.amber,
                ),
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
