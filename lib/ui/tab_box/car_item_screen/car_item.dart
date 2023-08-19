import 'package:api_default_project/data/model/car_item.dart';
import 'package:api_default_project/data/network/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CarItemScreen extends StatefulWidget {
  const CarItemScreen({super.key});

  @override
  State<CarItemScreen> createState() => _CarItemScreenState();
}

class _CarItemScreenState extends State<CarItemScreen> {


  CarItem? carItem;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    carItem = await ApiService.getCarItem();
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
        title: const Text("Car",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: isLoading? Center(child: CupertinoActivityIndicator(),) : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            CarouselSlider(
              items: carItem!.carPics != null
                  ? carItem!.carPics.map<Widget>((picUrl) {
                return CachedNetworkImage(
                  imageUrl: picUrl,
                  placeholder: (context, url) => CupertinoActivityIndicator(radius: 20,),
                  errorWidget: (context, url, error) => Icon(Icons.error,size: 50,),
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
              imageUrl: carItem!.logo ?? "Image not found",
              width: 60,
              height: 60,
              placeholder: (context, url) => CupertinoActivityIndicator(radius: 20,),
              errorWidget: (context, url, error) => Icon(Icons.error,size: 50,),
            ),
            Text('Car Model: ${carItem!.carModel}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Text('Established Year: ${carItem!.establishedYear}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Text('Average Price: ${carItem!.averagePrice}\$',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                'Description: ${carItem!.description}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}