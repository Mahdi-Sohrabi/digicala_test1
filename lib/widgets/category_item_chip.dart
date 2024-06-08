import 'package:digicala_test1/utils/style/styles.dart';
import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({super.key});

  @override
  Widget build(BuildContext context) {
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
