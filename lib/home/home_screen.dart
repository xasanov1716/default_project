import 'package:api_default_project/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context,listen: false);
    provider.getPerson();
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: provider.isLoading ? Center(child: CupertinoActivityIndicator()) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(provider.person!.results.first.picture.large)),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.person_2),
              const SizedBox(width: 10),
              Text(provider.person!.results.first.name.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),),
              const SizedBox(width: 10),
              Text(provider.person!.results.first.name.first,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),),
              const SizedBox(width: 10,),
              Text(provider.person!.results.first.name.last,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.location_on),
              const SizedBox(width: 10,),
              Row(
                children: [
                  SizedBox(width: 290,child: Text("${provider.person!.results.first.location.country} ${provider.person!.results.first.location.state} ${provider.person!.results.first.location.city} ${provider.person!.results.first.location.street.name} ${provider.person!.results.first.location.street.number}",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.email),
              SizedBox(width: 10,),
              Text(provider.person!.results.first.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.person_2),
              SizedBox(width: 10,),
              Row(
                children: [
                  Text(provider.person!.results.first.login.username,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                  SizedBox(width: 20,),
                  Icon(Icons.password),
                  SizedBox(width: 20,),
                  Text(provider.person!.results.first.login.password,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10,),
              Text(provider.person!.results.first.phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.person_2_sharp),
              SizedBox(width: 10,),
              Text(provider.person!.results.first.name.first,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}
