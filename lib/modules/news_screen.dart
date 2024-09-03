import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var them=Theme.of(context);
    return Stack(
      children: [
        Container(
          color:AppColor.whitecolor,
          child: Image.asset('assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
          fit: BoxFit.cover,),

        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News App',
              style:them.textTheme.bodySmall?.copyWith(
                  color: AppColor.whitecolor
              ),),
          ),
        ),
      ],
    );

  }
}
