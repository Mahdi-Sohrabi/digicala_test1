import 'package:digicala_test1/bloc/category/category_bloc.dart';
import 'package:digicala_test1/bloc/category/category_event.dart';
import 'package:digicala_test1/bloc/category/category_state.dart';
import 'package:digicala_test1/data/model/category1.dart';
import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:digicala_test1/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());
    super.initState();
  }

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
            BlocBuilder<CategoryBloc, CategoryState>(
                builder: ((context, state) {
              if (state is CategoryLodingState) {
                return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state is CategoryResponseStete) {
                return state.response.fold(
                  (l) {
                    return SliverToBoxAdapter(child: Center(child: Text(l)));
                  },
                  (r) {
                    return _ListCategory(list: r);
                  },
                );
              }
              return SliverToBoxAdapter(child: Text('error'));
            })),
          ],
        ),
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  final List<Category1>? list;
  const _ListCategory({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //Be careful, you may make a mistake in putting this ->()<- in making the sliver grid
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(((context, index) {
          return CachedImage(
            imageUrl: list?[index].thumbnail,
          );
        }), childCount: list?.length ?? 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
