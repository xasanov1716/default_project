import 'package:api_default_project/data/repository/file_info.dart';
import 'package:api_default_project/ui/widgets/single_file_download.dart';
import 'package:flutter/material.dart';

class AllFileScreen extends StatefulWidget {
  const AllFileScreen({Key? key}) : super(key: key);

  @override
  State<AllFileScreen> createState() => _AllFileScreenState();
}

class _AllFileScreenState extends State<AllFileScreen> {
  int doublePress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: 40,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://sun9-11.userapi.com/IHQyUrBtNY2WZSOosq3gWZ1topDVQujWrKex3Q/OhykQ51KmrM.jpg",fit: BoxFit.fill,),
              ))),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.black
              ),),
              Text("", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.white
              ),)
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network('https://besthqwallpapers.com/Uploads/5-8-2020/139300/telegram-turquoise-logo-4k-turquoise-brickwall-telegram-logo-social-networks.jpg',fit: BoxFit.cover,)),
          ListView(
            children: List.generate(filesData.length, (index) {
              var singleFile = filesData[index];
              return SingleFileDownload(fileInfo: singleFile);
            }),
          )
        ],
      ),
    );
  }
}
