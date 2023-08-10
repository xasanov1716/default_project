
import 'package:api_default_project/provider/countries_provider.dart';
import 'package:api_default_project/ui/tab_box/countries_screen/widget/countries_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/model.dart';
import '../../../data/network/api_service.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Country",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: context.read<CountryProvider>().isLoading? Center(child: CupertinoActivityIndicator(),) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                ...List.generate(context.read<CountryProvider>().countryModel.length, (index){
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesDetail(country: context.read<CountryProvider>().countryModel[index])));
                      },
                      title: Text(context.read<CountryProvider>().countryModel[index].name,style: TextStyle(fontSize: 24),),
                      leading: Text(context.read<CountryProvider>().countryModel[index].emoji,style: TextStyle(fontSize: 24),),

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