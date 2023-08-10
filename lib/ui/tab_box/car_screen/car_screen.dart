import 'package:api_default_project/data/model/car_model.dart';
import 'package:api_default_project/ui/tab_box/car_screen/widget/car_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../../data/network/api_provider.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {


  CarsModel? carsModel;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    carsModel = await ApiService.getAllCars();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Cars",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: isLoading? Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                ...List.generate(carsModel!.data.length, (index){
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CarDetail(car:carsModel!.data[index])));
                      },
                      title: Text(carsModel!.data[index].carModel,style: TextStyle(fontSize: 24),),
                      leading:CachedNetworkImage(
                        imageUrl: carsModel!.data[index].logo ?? "",
                        width: 50,
                        height: 50,
                        placeholder: (context, url) => CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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