import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class DynamicView {
  final String title;
  final int sort;
  final String group;
  final double width;
  final double height;
  final Color color;
  final String type;

  DynamicView({
    required this.title,
    required this.sort,
    required this.group,
    required this.width,
    required this.height,
    required this.color,
    required this.type,
  });
}

class MyApp extends StatelessWidget {
  Future<List<DynamicView>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://dynamic-view-api.free.mockoapp.net/views'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dynamicViewsData = jsonData['dynamic_views'];
      List<DynamicView> dynamicViews = [];
      for (var viewData in dynamicViewsData) {
        dynamicViews.add(DynamicView(
          title: viewData['title'],
          sort: viewData['sort'],
          group: viewData['group'],
          width: viewData['width'].toDouble(),
          height: viewData['height'].toDouble(),
          color: Color(int.parse(viewData['color'].replaceAll("#", "0xFF"))),
          type: viewData['type'],
        ));
      }
      return dynamicViews;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic View Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dynamic View'),
        ),
        body: FutureBuilder<List<DynamicView>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(color: Colors.black,radius: 25,),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  DynamicView view = snapshot.data![index];
                  return Container(
                    width: view.width,
                    height: view.height,
                    color: view.color,
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Center(
                            child: Text(
                              view.title,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          // SizedBox(height: 24,),
                          Row(
                            children: [
                              Spacer(),
                              RichText(text: TextSpan(
                                text: 'Type  ',
                                style: TextStyle(color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: view.type,
                                    style:  TextStyle(color: Colors.white)
                                  )
                                ]
                              ), ),
                              SizedBox(width: 20,)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}