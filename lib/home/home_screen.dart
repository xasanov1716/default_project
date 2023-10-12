import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:api_default_project/data/repositories/check_info_data.dart';
import 'package:api_default_project/home/widgets/check_info.dart';
import 'package:api_default_project/home/widgets/global_button.dart';
import 'package:api_default_project/utils/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey containerKey = GlobalKey();

  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                RepaintBoundary(
                  key: containerKey,
                  child: Container(
                      padding: const EdgeInsets.all(24),
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckInfo(title: Image.asset('assets/images/gas.jpg',height: MediaQuery.of(context).size.height * 60 / 812,), trailing: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(child: Text('kummunal xizmatlar',style: TextStyle(color: Colors.white),)),
                          )),
                        const  Text("СП ООО <<HUDUDGAZTA'MINOT>>",style: TextStyle(color: Colors.grey),),
                          ...List.generate(
                              title.length,
                              (index) => CheckInfo(
                                  title: Text(title[index],style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),), trailing: Text(trailing[index],style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),)))
                        ],
                      )),
                ),
              ],
            ),
          ),
          GlobalButton(text: 'Share', onTap: (){
            saveToGallery();
          })
        ],
      ),
    );
  }

  _takeScreenshot<Uint8List>() async {
    RenderRepaintBoundary boundary = containerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    var im = await boundary.toImage();
    var byteData = await im.toByteData(format: ImageByteFormat.png);
    setState(() {
      imageBytes = byteData!.buffer.asUint8List();
    });
    const String fileName = 'screenshot.png';
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$fileName';
    File(filePath).writeAsBytesSync(imageBytes!);
    Share.shareFiles([filePath]);
    return byteData!.buffer.asUint8List();
  }

  saveToGallery() async {
    await PermissionUtil.requestAll();
    var pngBytes = await _takeScreenshot();
    var t = await ImageGallerySaver.saveImage(pngBytes);
  }
}
