import 'package:api_default_project/provider/car_item_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/car_item.dart';
import '../../../data/network/api_service.dart';
class CarItemScreen extends StatefulWidget {
  const CarItemScreen({super.key});

  @override
  State<CarItemScreen> createState() => _CarItemScreenState();
}

class _CarItemScreenState extends State<CarItemScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Car",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: context.read<CarItemProvider>().isLoading? Center(child: CupertinoActivityIndicator(),) : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            CarouselSlider(
              items: context.read<CarItemProvider>().carsModel!.carPics != null
                  ? context.read<CarItemProvider>().carsModel!.carPics.map<Widget>((picUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CachedNetworkImage(
                    imageUrl: picUrl,
                    placeholder: (context, url) => CupertinoActivityIndicator(radius: 20,),
                    errorWidget: (context, url, error) => Icon(Icons.error,size: 50,),
                  ),
                );
              }).toList()
                  : [],
              options: CarouselOptions(
                height: 220,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            CachedNetworkImage(
              imageUrl: context.read<CarItemProvider>().carsModel!.logo ?? "Image not found",
              width: 60,
              height: 60,
              placeholder: (context, url) => CupertinoActivityIndicator(radius: 20,),
              errorWidget: (context, url, error) => Icon(Icons.error,size: 50,),
            ),
            Text('Car Model: ${context.read<CarItemProvider>().carsModel!.carModel}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Text('Established Year: ${context.read<CarItemProvider>().carsModel!.establishedYear}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Text('Average Price: ${context.read<CarItemProvider>().carsModel!.averagePrice}\$',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Text(
                'Description: ${context.read<CarItemProvider>().carsModel!.description}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}