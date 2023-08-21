import 'package:api_default_project/cubits/pow/pow_cubit.dart';
import 'package:api_default_project/cubits/pow/pow_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/global_text_field.dart';

class PowScreen extends StatefulWidget {
  const PowScreen({Key? key}) : super(key: key);

  @override
  State<PowScreen> createState() => _PowScreenState();
}

class _PowScreenState extends State<PowScreen> {

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            UniversalTextField(controller: aController, hintext: 'Enter number', type: TextInputType.number, action: TextInputAction.done, onChanged: (value) {
              context.read<PowCubit>().initialA(value);
            },),
            SizedBox(height: 24),
            UniversalTextField(controller: bController, hintext: 'Enter number', type: TextInputType.number, action: TextInputAction.done, onChanged: (value) {
              context.read<PowCubit>().initialB(value);
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: (){
        },
      ),
    );
  }
}
