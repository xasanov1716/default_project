import 'package:api_default_project/bloc/user/user_bloc.dart';
import 'package:api_default_project/bloc/user/user_event.dart';
import 'package:api_default_project/bloc/user/user_state.dart';
import 'package:api_default_project/bloc/user_multi_state/multi_state_bloc.dart';
import 'package:api_default_project/bloc/user_multi_state/user_event.dart';
import 'package:api_default_project/data/models/form_status.dart';
import 'package:api_default_project/data/models/user_model.dart';
import 'package:api_default_project/local/db/local_database.dart';
import 'package:api_default_project/ui/home/widgets/age_textfield.dart';
import 'package:api_default_project/ui/home/widgets/global_text_field.dart';
import 'package:api_default_project/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController jobsTitleController = TextEditingController();

    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add User Screeen'),
        ),
        body: BlocConsumer<UserBloc, UserSingleState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if(state.status == FormStatus.loading){
              return const Center(child: CupertinoActivityIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  GlobalTextField(
                      hintText: 'FirstName',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller: firstNameController),
                  const SizedBox(height: 12),
                  GlobalTextField(
                      hintText: 'LastName',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller: lastNameController),
                  const SizedBox(
                    height: 12,
                  ),
                  AgeTextField(
                      hintText: 'Age',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.start,
                      controller: ageController),
                  const SizedBox(
                    height: 12,
                  ),
                  GlobalTextField(
                      hintText: 'Jobs',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.start,
                      controller: jobsTitleController),
                  const SizedBox(
                    height: 12,
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      if (firstNameController.text.isNotEmpty &&
                          lastNameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty &&
                          jobsTitleController.text.isNotEmpty) {
                        BlocProvider.of<UserBloc>(context).add(AddUser(
                            userModel: UserModel(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                gender: 'Male',
                                age: int.parse(ageController.text),
                                jobTitle: jobsTitleController.text)));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: const Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
