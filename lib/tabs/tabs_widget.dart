import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/tabs/tab_item.dart';

import '../model/source.dart';

class TabsWidget extends StatefulWidget {
List<Sources> sourcelist;

TabsWidget({required this.sourcelist});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:widget.sourcelist.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index){
              selectedindex=index;
             setState(() {

             });
            }
                ,isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sourcelist.map((Sources)=>TabItem(
                source: Sources,
                isSelected: selectedindex==widget.sourcelist.indexOf(Sources)),).toList()

            ),
            Expanded(child: NewsWidget(source: widget.sourcelist[selectedindex]))
          ],
        ));
  }
}
