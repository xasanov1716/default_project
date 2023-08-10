import 'package:api_default_project/data/model/car_model.dart';
import 'package:api_default_project/provider/car_provider.dart';
import 'package:api_default_project/ui/tab_box/car_screen/widget/car_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/network/api_service.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Cars",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: context.read<CarProvider>().isLoading? Center(child: CupertinoActivityIndicator(),) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                ...List.generate(context.read<CarProvider>().cars.length, (index){
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CarDetail(car:context.read<CarProvider>().cars[index].data[index])));
                      },
                      title: Text(context.read<CarProvider>().cars[index].data[index].carModel,style: TextStyle(fontSize: 24),),
                      leading:CachedNetworkImage(
                        imageUrl: context.read<CarProvider>().cars[index].data[index].logo ?? "",
                        width: 50,
                        height: 50,
                        placeholder: (context, url) => CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Image.network("https://avatars.mds.yandex.net/i?id=44e2e6a9778189756ae450df5d1405e8d773a4b0-5238529-images-thumbs&n=13"),
                      ),

                    ),
                  );
                })
              ],
            ))
          ],
        ),
      ),
    );
  }
}