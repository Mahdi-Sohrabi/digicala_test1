import 'package:digicala_test1/data/Repository/category_repository.dart';
import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category1>? list;
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
                      print(l);
                    },
                    (r) {
                      setState(() {
                        list = r;
                      });
                    },
                  );
                },
                child: Text('get data'),
              ),
            ),
            _ListCategory(
              list: list,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _ListCategory extends StatelessWidget {
  List<Category1>? list;
  // ignore: use_super_parameters
  _ListCategory({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CachedImage(
            imageUrl: list?[index].thumbnail,
          );
        }, childCount: list?.length ?? 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
