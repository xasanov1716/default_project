import 'package:api_default_project/data/getx_controllers/defination_controller.dart';
import 'package:api_default_project/data/network/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DefinationScreen extends StatelessWidget {
  const DefinationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DefinitionController controller = Get.put(DefinitionController(apiService: ApiService()));

TextEditingController text = TextEditingController();

    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Defination"),
        ),
        body: Stack(
          children: [
            Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                       Row(
                        children: [
                       SizedBox(width : 250,child: TextField(
                        controller: text,
                        decoration: const InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      )),
                          ZoomTapAnimation(
                            onTap: (){
                              if(text.text.isNotEmpty){
                              controller.getDefinition(word: text.text);
                              text.clear();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin:const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                color: Colors.black
                              ),
                              child: const Text('Search',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,letterSpacing: 0.4,color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child:  controller.definition.isEmpty? const Center(child:  Text('Empty',style: TextStyle(fontSize: 26),)) :  ListView(
                          physics : const BouncingScrollPhysics(),
                          children: [
                            ...List.generate(controller.definition.first.meanings!.first.definitions.length, (index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(26)
                                ),
                                child: ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(controller.definition.first.word!),
                                    ],
                                  ),
                                  title: Text(controller.definition.first.meanings!.first.definitions[index].definition,style: const TextStyle(color: Colors.white),),
                                ),
                              );
                            })
                          ],
                        ) ,
                      ),
                    ],
                  ),
                );
              },
            ),
            Align(
              child: Obx(() {
                return Visibility(
                  visible: controller.isLoading.value,
                  child: const CupertinoActivityIndicator(color: Colors.black,radius: 20,),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
