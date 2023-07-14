import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/product/rating_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating});

  final String title;
  final num price;
  final String description;
  final String image;
  final RatingModel rating;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: 1 > 0,
          backgroundColor: Colors.blue,
          title: const Text('About'),
        ),
        body: Stack(children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                CachedNetworkImage(imageUrl: widget.image,height: 120,placeholder: (context,url)=>CupertinoActivityIndicator(),errorWidget: (context,url,error)=>Icon(Icons.error),),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.rating.rate.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Price ${widget.price} \$',
                            style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Center(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 100,
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 640,
            left: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * (57 / 812),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * (326 / 375),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                        elevation: const MaterialStatePropertyAll<double>(10),
                        backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.blue)),
                    child: const Text(
                      'Buy',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
