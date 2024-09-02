// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    super.key,
    required this.loading, required this.categories,

  });
  final bool loading;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: loading ? 4 : categories.length,
        itemBuilder: (context, i) {
        
          return loading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade300,
                  child: Card(
                    shape: CircleBorder(),
                    elevation: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      
                    ),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: CircleBorder(),
                      elevation: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.filter_alt_off_sharp,
                          size: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(categories[i].toString()),
                    ),
                  ],
                );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
