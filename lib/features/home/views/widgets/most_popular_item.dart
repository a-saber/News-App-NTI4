import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularItem extends StatelessWidget {
  const MostPopularItem({super.key, required this.title, required this.description, required this.imageUrl});

final String title;
final String description;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: REdgeInsetsDirectional.only(end: 17),
                      child: SizedBox(
                        width: 240.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 330.h,
                                width: 240.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.cover,
                                  )
                                ),
                              ),
                            ),
                            Text(title, 
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h,),
                            Text(description, 
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}