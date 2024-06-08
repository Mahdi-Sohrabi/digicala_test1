import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/widgets/category_item_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                        'حساب کاربری',
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
            const SizedBox(height: 30),
            const Text(
              'مهدی سهرابی ',
              style: TextStyle(fontFamily: 'SB', fontSize: 16),
            ),
            const Text(
              '09015368279',
              style: TextStyle(fontFamily: 'SB', fontSize: 10),
            ),
            const SizedBox(height: 30),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                  CategoryItemChip(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            const Text(
              'v-1.0.00',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            const Text(
              'Instagram.com/mahdi-dev',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
