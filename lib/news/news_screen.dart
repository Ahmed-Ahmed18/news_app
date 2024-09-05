import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/tabs/tabs_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
          body: FutureBuilder<Source?>(
              future: ApiManger.getSources(),
              builder:(context,snapshot){
               if(snapshot.connectionState==ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator(
                   color: AppColor.primarycolor,
                 ),);
               }else if(snapshot.hasError){
                 return Column(
                   children: [
                     Text('Something Went Wrong',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                       color: AppColor.blackcolor,
                       fontSize: 16
                     ),),
                     Center(child: ElevatedButton(onPressed: (){

                       ApiManger.getSources();
                       setState(() {

                       });
                     }, child:Text('Try Again')))
                   ],
                 );
               }if(snapshot.data!.status=='error'){
                  return Column(
                   children: [
                     Text(snapshot.data!.message!),
                     ElevatedButton(
                     onPressed: (){
                       ApiManger.getSources();
                       setState(() {

                       });
                     }, child:Text('Try Again'))
                   ],
                 );
               }
               var sourcelist=snapshot.data!.sources!;
               return TabsWidget(sourcelist: sourcelist);
              }),
        ),
      ],
    );

  }
}
