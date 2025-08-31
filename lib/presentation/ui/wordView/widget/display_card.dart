import 'package:dictionary/core/constant/appColor.dart';
import 'package:flutter/material.dart';

class display_card extends StatelessWidget {
  final String header;
  final String meaning;
  final double? fontSize;
  const display_card({
    super.key,
    required this.header,
    required this.meaning,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                      color: AppColor.PrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                ],
              ),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  meaning,
                  style: TextStyle(fontSize: fontSize ?? 27),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
