import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_font.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    //Membuat Search Bar
    return InkWell(
      onTap: () {
        print("search");
      },
      child: Container(
        width: ScreenUtil().setWidth(500),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).w,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).w,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20).w,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                // placeHolderText,
                "Cari Makanan",
                style: text12.copyWith(
                    color: Colors.grey[600],
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),

            //List Data Dari API theMealDB
          ],
        ),
      ),
    );
  }
}
