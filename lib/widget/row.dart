import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowText extends StatelessWidget {
  String title, value;
  RowText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Text('  :  '),
        Container(
          width: 208.w,
          child: Text(
            overflow: TextOverflow.ellipsis,
            value,
            style: TextStyle(fontSize: 16.sp),
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
