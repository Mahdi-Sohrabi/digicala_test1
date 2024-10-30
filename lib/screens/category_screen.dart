import 'package:digicala_test1/data/Repository/category_repository.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          'دسته بندی',
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
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () async {
                  var repository = CategoryRepository();
                  var either = await repository.getCategorys();
                  either.fold(
                    (l) {
                      // ignore: avoid_print
                      print(l);
                    },
                    (r) {
                      // ignore: avoid_function_literals_in_foreach_calls
                      r.forEach(
                        (element) {
                          // ignore: avoid_print
                          print(element.title);
                          print(element.id);
                        },
                      );
                    },
                  );
                },
                child: Text('get data'),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
