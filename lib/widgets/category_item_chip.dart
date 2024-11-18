import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/utils/style/styles.dart';
import 'package:digicala_test1/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  final Category1 category;
  const CategoryItemChip(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);

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
                color: Color(hexColor),
                //Tihs For Shadow Under container
                shadows: [
                  BoxShadow(
                    color: Color(hexColor),

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
            SizedBox(
              height: 24,
              width: 24,
              child: CachedImage(
                imageUrl: category.icon,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          category.title ?? 'محصول',
          style: AppStyles.itemGrouping,
        )
      ],
    );
  }
}
