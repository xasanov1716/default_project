import 'package:api_default_project/bloc/user/user_bloc.dart';
import 'package:api_default_project/bloc/user/user_event.dart';
import 'package:api_default_project/bloc/user/user_state.dart';
import 'package:api_default_project/bloc/user_multi_state/multi_state_bloc.dart';
import 'package:api_default_project/bloc/user_multi_state/user_state.dart';
import 'package:api_default_project/data/models/form_status.dart';
import 'package:api_default_project/data/models/user_model.dart';
import 'package:api_default_project/local/db/local_database.dart';
import 'package:api_default_project/ui/home/subcreen/add_user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_multi_state/user_event.dart';



class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddUserScreen()));
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: BlocConsumer<UserBloc,UserSingleState>(
        builder: (context,state){

          if(state.status == FormStatus.loading){
            return const Center(child:  CupertinoActivityIndicator());
          }
          return state.user.isNotEmpty?  ListView(
            children: [
              ...List.generate(state.user.length, (index) => ListTile(
                title: Text(state.user[index].firstName),
                subtitle: Text(state.user[index].lastName),
                trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){
                  context.read<UserBloc>().add(DeleteUser(userId: state.user[index].id ?? 0));
                },),
              ))
            ],
          ) : const Center(child: Text('EMPTY'));
        },
        listener: (context,state){

        },
      )
    );
  }
}
