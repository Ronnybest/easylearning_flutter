import 'package:easylearning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_states.dart';
import 'widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomeBlocs, HomeStates>(
        builder: (context, state) => Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: CustomScrollView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: buildText(
                  text: "Hello,",
                  color: AppColors.primaryThreeElementText,
                  top: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: buildText(
                  text: "Zeppon",
                  color: AppColors.primaryText,
                  top: 5,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 20.h),
              ),
              SliverToBoxAdapter(
                child: searchView(),
              ),
              SliverToBoxAdapter(
                child: slidersView(context, state),
              ),
              SliverToBoxAdapter(
                child: menuView(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.w),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/icons/Image(2).png"),
                            ),
                          ),
                          child: courseGrid(),
                        ),
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
