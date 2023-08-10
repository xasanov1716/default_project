import 'package:api_default_project/repostory/repository.dart';
import 'package:api_default_project/widgets/api_swich.dart';
import 'package:flutter/material.dart';

import 'model/dynamic_view_model.dart';

class DynamicViewPage extends StatelessWidget {
  const DynamicViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<DynamicViewModel>> repository =
        MyRepository().getDynamicFields();
    Future<List<DynamicViewModel>> dynamicView = repository;
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: FutureBuilder(
          future: dynamicView,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(snapshot.data!.length, (index) {
                      return Container(
                        height: snapshot.data![index].height.toDouble(),
                        width: snapshot.data![index].width.toDouble(),
                        decoration: BoxDecoration(
                            color: ApiSwich.returnColor(
                                snapshot.data![index].color.toString())),
                        child: Center(child: Text(snapshot.data![index].group)),
                      );
                    })
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
