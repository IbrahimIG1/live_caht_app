import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String upperTitle;

  const TopBar({
    required this.title,
    required this.upperTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).shadowColor,
          ],
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0.h),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 12.0.h),
                  child: Text(
                    upperTitle,
                    style:  TextStyle(
                      color: Colors.white70,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  title,
                  style:  TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Spacer(),
            if (upperTitle.isNotEmpty)
              CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                radius: 25,
                child: Center(
                  child: Text(
                    title
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
