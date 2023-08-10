
import 'package:api_default_project/ui/tab_box/countries_screen/widget/countries_detail.dart';
import 'package:flutter/material.dart';

import '../../../data/model/model.dart';
import '../../../data/network/api_provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {


  CountryData? countryData;

  bool isLoading = false;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    countryData = await ApiService.getCountry();
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
        title: const Text("Country",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: isLoading? Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                ...List.generate(countryData!.data.countries.length, (index){
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesDetail(country: countryData!.data.countries[index])));
                      },
                      title: Text(countryData!.data.countries[index].name,style: TextStyle(fontSize: 24),),
                      leading: Text(countryData!.data.countries[index].emoji,style: TextStyle(fontSize: 24),),

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