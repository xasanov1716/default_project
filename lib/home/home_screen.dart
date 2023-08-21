import 'package:api_default_project/cubits/button_cubit/button_cubit.dart';
import 'package:api_default_project/cubits/button_cubit/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Column(
        children: [
          BlocBuilder<ButtonCubit, TaskState>(builder: (context, state){
       return   SizedBox(
         height: 70,
         child: ListView(
           scrollDirection: Axis.horizontal,
           children: [
             ...List.generate(5, (index) => ZoomTapAnimation(
               onTap: (){
                 isCheck = !isCheck;
                 context.read<ButtonCubit>().changeState(index);
               },
               child: Container(
                 margin: EdgeInsets.all(16),
                 height: 60, width: 60,
                 decoration: BoxDecoration(
                     color: context.read<ButtonCubit>().indexes.contains(index)? Colors.blue: Colors.green,
                     borderRadius: BorderRadius.circular(16)
                 ),
               ),
             ))
           ],
         ),
       );
      })
        ],
      ),
    );
  }
}
