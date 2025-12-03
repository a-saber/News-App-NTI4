import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderItemBuilder extends StatelessWidget {
  const SliderItemBuilder({super.key, required this.title, required this.author, required this.imageUrl});

final String title;
final String author;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned.fill(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          )
                        )
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity( 0.3),
                      padding: REdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w,),
                          Text(author, style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),)

                        ],
                      ),
                    )
                  ],
                );
              
  }
}