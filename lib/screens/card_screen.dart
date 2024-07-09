import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 30, left: 30, top: 20, bottom: 20),
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
                              'سبد خرید',
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
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return const CardItem();
                  }, childCount: 10),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: 100,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 44, left: 44, bottom: 20),
              child: SizedBox(
                height: 53,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenApp,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'ادامه فرایند خرید',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'sm',
                      color: AppColors.whiteApp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 44, left: 44, bottom: 20),
      height: 249,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.whiteApp,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('1'),
                        const Text('1'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
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
                            const Text('تومان'),
                            const Text('49.500.000'),
                          ],
                        ),
                        const Wrap(
                          children: [
                            OptionCheap(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset('assets/images/iphone.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 2.0,
              dashGapLength: 4,
              dashColor: AppColors.greyApp.withOpacity(0.5),
              dashLength: 8,
              dashGapColor: Colors.transparent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تومان'),
                SizedBox(width: 5),
                Text('48.500.000'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  const OptionCheap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyApp, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/icon_options.png'),
            const SizedBox(width: 10),
            const Text('256'),
          ],
        ),
      ),
    );
  }
}
