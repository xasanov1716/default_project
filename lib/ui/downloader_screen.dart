import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/downloader_cubit.dart';

class DownloaderScreen extends StatefulWidget {
  const DownloaderScreen({Key? key}) : super(key: key);

  @override
  State<DownloaderScreen> createState() => _DownloaderScreenState();
}

class _DownloaderScreenState extends State<DownloaderScreen> {
  List<String> fileUrls = [
    "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
    "https://nevomusic.net/video/28099/",
    "https://uzhits.net/uploads/files/2023-07/xamdam-sobirov-janze_(uzhits.net).mp3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF414040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2F2F),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back),
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(Icons.bookmark_outlined),
            ),
            const Text("Saqlangan xabarlar"),
          ],
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
      body: BlocBuilder<DownloaderCubit, DownloaderState>(
        builder: (context, state) {
          return ListView(
            children: [
              ...List.generate(
                fileUrls.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 28, right: 5),
                        child: CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.network(
                              "https://picsum.photos/300/${index}00",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF838383),
                          ),
                          color: const Color(0xFF2F2F2F),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 7),
                                ListTile(
                                  onTap: () {},
                                  leading: GestureDetector(
                                    onTap: () {
                                      context.read<DownloaderCubit>().downloadFile(
                                            fileName: "file",
                                            url: fileUrls[index],
                                          );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: SizedBox(
                                                height: 45,
                                                width: 45,
                                                child: Visibility(
                                                  visible: state.progress != 1.0,
                                                  child: CircularProgressIndicator(
                                                    value: state.progress,
                                                    color: Colors.white,
                                                    backgroundColor: Colors.blue,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: state.progress != 1.0 && state.progress == 0.0
                                                  ? const Icon(
                                                      Icons.arrow_downward_rounded,
                                                      color: Colors.white,
                                                      size: 22,
                                                    )
                                                  : state.progress != 1.0 && state.progress != 0.0
                                                      ? Text(
                                                          "${(state.progress * 100).toInt()}%",
                                                          style: const TextStyle(color: Colors.white),
                                                        )
                                                      : const Icon(
                                                          Icons.description,
                                                          color: Colors.white,
                                                          size: 22,
                                                        ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "${fileUrls[index].substring(8, 19)}...",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "${state.progress*100}%",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 62, right: 10),
                                child: Text(
                                  "${DateTime.now().hour}:${DateTime.now().minute + index}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
