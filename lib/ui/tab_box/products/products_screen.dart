import 'package:api_default_project/ui/tab_box/products/sub_screens/product_add_screen.dart';
import 'package:api_default_project/ui/tab_box/products/widgets/category_selector.dart';
import 'package:api_default_project/ui/tab_box/products/widgets/products_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/product/product_model.dart';
import '../../../data/network/providers/api_provider.dart';
import '../../../data/network/repositories/category_repo.dart';
import '../../../data/network/repositories/product_repo.dart';
import '../tab_box.dart';
import 'detail_screen/product_detail_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    required this.productRepo,
    required this.categoryRepo,
  }) : super(key: key);

  final ProductRepo productRepo;
  final CategoryRepo categoryRepo;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String activeCategoryName = "";

  List<ProductModel> products = [];
  List<String> categories = [];
  TextEditingController dialog = TextEditingController();

  bool isLoading = false;
  int limit = 0;

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    products =
        await widget.productRepo.getProductsByCategory(activeCategoryName);
    setState(() {
      isLoading = false;
    });
  }


  _limitProducts(String limit)async{
    setState(() {
      isLoading = true;
    });
    products =
    await widget.productRepo.getProductsByLimit(limit);
    setState(() {
      isLoading = false;
    });
  }

  _sortProducts(String sort) async {
    setState(() {
      isLoading = true;
    });
    products =
    await widget.productRepo.getSortedProducts(sort);
    setState(() {
      isLoading = false;
    });
  }

  void _showLimitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Set Limit',
            style: TextStyle(color: Colors.deepPurple),
          ),
          content: TextField(
            controller: dialog,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                limit = int.tryParse(value) ?? 0;
              });
            },
            decoration: const InputDecoration(
              hintText: 'Enter a limit',
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
              onPressed: () {
              _limitProducts(dialog.text);
              setState(() {

              });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabBox(apiProvider: ApiProvider()),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }


  _init() async {
    categories = await widget.categoryRepo.getAllCategories();
  }

  @override
  void initState() {
    _init();
    _updateProducts();
    super.initState();
  }
  int menu = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Products screen"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductAddScreen(productRepo: widget.productRepo);
                    },
                  ),
                );
              },
              icon: const Icon(Icons.add)),
          PopupMenuButton<int>(
            onSelected: (value){
                setState(() {
                  menu = value;
                });
                if(menu==2){
                  _sortProducts('asc');
                }else if(menu == 3){
                _sortProducts('desc');
                }else{
                  _showLimitDialog();
                  setState(() {

                  });
                }
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            // offset: Offset(-50, 0),
            position: PopupMenuPosition.values.last,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Limit'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Sort by A-Z'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('Sort by Z-A'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6,right: 6,top: 12),
        child: Column(
          children: [
            categories.isNotEmpty
                ? CategorySelector(
                    categories: categories,
                    onCategorySelected: (selectedCategory) {
                      activeCategoryName = selectedCategory;
                      _updateProducts();
                    },
                  )
                : const Center(child: CupertinoActivityIndicator()),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: ProductLoadingShimmer(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: GridView(
                              physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.all(20),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 0.6,
                                ),
                                children: List.generate(products.length, (index) {
                                  ProductModel product = products[index];
                                  return ZoomTapAnimation(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailScreen(
                                                    title: product.title,
                                                    description:
                                                        product.description,
                                                    price: product.price,
                                                    image: product.image,
                                                    rating: product.rating,
                                                  )));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          )
                                        ],
                                        border: Border.all(
                                          color: Colors.greenAccent,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              RichText(text: TextSpan(
                                                text: '\$',
                                                style: TextStyle(fontWeight: FontWeight.w600,fontSize : 18,color: Colors.red),
                                                children:[ TextSpan(
                                                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.red,fontSize: 14),
                                                    text: '${product.price}'
                                                )]
                                              ))
                                            ],
                                          ),
                                          CachedNetworkImage(
                                            imageUrl: product.image,height: 120,
                                            placeholder: (context,url)=>CupertinoActivityIndicator(),
                                            errorWidget: (context,url,error)=>Icon(Icons.error),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                            Text("${product.title}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          Spacer(), 

                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                product.rating.rate.toString(),
                                                style: const TextStyle(
                                                    fontSize: 10 + 6,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
