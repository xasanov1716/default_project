import 'package:api_default_project/cubits/pow/pow_cubit.dart';
import 'package:api_default_project/cubits/pow/pow_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'widgets/global_text_field.dart';

class PowScreen extends StatefulWidget {
  const PowScreen({Key? key}) : super(key: key);

  @override
  State<PowScreen> createState() => _PowScreenState();
}

class _PowScreenState extends State<PowScreen> {

 

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              UniversalTextField( hintext: 'Enter number one', type: TextInputType.number, action: TextInputAction.done, onChanged: (value) {
                if(value.isNotEmpty){
                  context.read<PowCubit>().initialA(double.parse(value));
                  context.read<PowCubit>().getPow();
                }
              },),
              SizedBox(height: 24),
              UniversalTextField(hintext: 'Enter number two', type: TextInputType.number, action: TextInputAction.done, onChanged: (value) {
                if(value.isNotEmpty){
                  context.read<PowCubit>().initialB(double.parse(value));
                  context.read<PowCubit>().getPow();
                }
              },),
            Spacer(),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey
                ),
                child: BlocBuilder<PowCubit, PowState>(builder: (context, state)=>Center(child: Text(
                    context.read<PowCubit>().state.result != 0
                        ? context.read<PowCubit>().state.result.toString()
                        : "",))
              ),),
              SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}
