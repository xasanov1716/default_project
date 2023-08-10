import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/car_model.dart';

class CarDetail extends StatelessWidget {
  const CarDetail({super.key, required this.car});
  final Datum car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),color: Colors.white,),
        title: Text(car.carModel,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: car.logo ?? "",
              width: 250,
              height: 250,
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(height: 10,),
            Text("Price : ${car.averagePrice} \$",style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text("Established Year : ${car.establishedYear}",style: const TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }
}