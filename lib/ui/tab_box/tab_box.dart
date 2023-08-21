import 'package:api_default_project/cubits/navigation_bar/navigation_bar_cubit.dart';
import 'package:api_default_project/cubits/navigation_bar/navigation_bar_state.dart';
import 'package:api_default_project/ui/tab_box/auth_screen/auth_screen.dart';
import 'package:api_default_project/ui/tab_box/pow_screen/pow_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TabBox extends StatelessWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBarCubit, TabState>(
        builder: (context, state){
          if(state is PowScreenState){
            return PowScreen();
          }
          return AuthScreen();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (index)=>context.read<NavigationBarCubit>().updateScreen(index: index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.power),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high),label: ''),
        ],
      ),
    );
  }
}
