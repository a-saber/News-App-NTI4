import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti4_news/core/widgets/custom_carousal_slider.dart';
import 'package:nti4_news/features/home/cubit/home_cubit/home_cubit.dart';
import 'package:nti4_news/features/home/cubit/home_cubit/home_state.dart';
import 'package:nti4_news/features/home/views/widgets/most_popular_item.dart';
import 'package:nti4_news/features/home/views/widgets/slider_item_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home View'),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: 
              [
                SizedBox(height: 24.h,),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 32),
                  child: CustomCarousalSlider(
                    items: List.generate(5, (index) => SliderItemBuilder(
                      title: 'Title $index', author: 'Description $index', 
                      imageUrl: 'https://picsum.photos/200/200?image=${index + 20}')
                      ),
                      onPageChanged: HomeCubit.get(context).onIndexChanged,

                  )
                ),
                DotsIndicator(
                  dotsCount: 5,
                  position: HomeCubit.get(context).currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    color: Colors.black87, // Inactive color
                    activeColor: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 16.h,),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Most Popular', style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                  SizedBox(width: 24.w,),
                  TextButton(onPressed: (){}, child: Text('See More',style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2D5BD0)
                  ),)),
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
                SizedBox(
                  height: 330.h,
                  child: ListView.builder(
                    padding: REdgeInsets.symmetric(horizontal: 32),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MostPopularItem(
                      title: 'Title $index', description: 'Description $index', 
                      imageUrl: 'https://picsum.photos/200/200?image=${index + 20}'))
                    ),
                  
                  
              ],
            );
          }
        ),
      ),
    );
  }
}