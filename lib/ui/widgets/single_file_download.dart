import 'package:api_default_project/cubit/downloader_cubit.dart';
import 'package:api_default_project/cubit/downloader_state.dart';
import 'package:api_default_project/data/repository/file_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleFileDownload extends StatelessWidget {
  SingleFileDownload({Key? key, required this.fileInfo}) : super(key: key);

  final FileInfo fileInfo;
  DownLoaderCubit fileManagerCubit = DownLoaderCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fileManagerCubit,
      child: BlocBuilder<DownLoaderCubit, DownLoaderState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 70),
                height: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFFE1FEC6).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: ListTile(
                    leading: state.newFileLocation.isEmpty
                        ? Stack(children: [
                      Container(height: 56, width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.blue
                        ),
                      ),
                      state.progress == 0 ? const SizedBox(
                          height: 56,
                          width: 56,
                          child: Center(child: Icon(Icons.arrow_downward, size: 35, color: Colors.white,))) :
                      const SizedBox(
                          height: 56,
                          width: 56,
                          child: Center(child: Icon(Icons.clear, size: 42, color: Colors.white,))),
                      AnimatedContainer(
                        margin: const EdgeInsets.all(14),
                        duration: const Duration(seconds: 1),
                        height: 56,
                        width: 56,
                        padding: const EdgeInsets.all(14),
                        child: CircularProgressIndicator(
                          value: state.progress,
                          color: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                      )
                    ],)
                        : Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.blue
                        ),
                        child: const Icon(Icons.description, color: Colors.white,)),
                    title: Text(fileInfo.fileName),
                    subtitle: state.progress != 0 && state.progress != 1.0  ? Text("${(fileInfo.memory*state.progress).toString().substring(0,4)} / ${fileInfo.memory} MB") :  Text("${fileInfo.memory.toString()} MB"),
                    onTap: () {
                      context
                          .read<DownLoaderCubit>()
                          .downloadFile(fileInfo: fileInfo);
                    },
                  ),
                ),
              ),
              Positioned(
                  right: 80,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 100,
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.more_vert),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(fileInfo.time, style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ],
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}