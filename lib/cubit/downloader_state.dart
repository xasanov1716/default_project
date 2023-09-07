// part of 'downloader_cubit.dart';
//
// class DownloaderState  {
//   const DownloaderState({
//     required this.progress,
//     required this.myStream,
//   });
//
//   final double progress;
//   final StreamController<double> myStream;
//
//   DownloaderState copyWith({
//     double? progress,
//     StreamController<double>? myStream,
//   }) =>
//       DownloaderState(
//         progress: progress ?? this.progress,
//         myStream: myStream ?? this.myStream,
//       );
// }

import 'package:equatable/equatable.dart';



class DownLoaderState extends Equatable {
  const DownLoaderState({
    required this.progress,
    required this.newFileLocation,
  });

  final double progress;
  final String newFileLocation;

  DownLoaderState copyWith({
    double? progress,
    String? newFileLocation,
  }) =>
      DownLoaderState(
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
      );

  @override
  List<Object?> get props => [
    progress,
    newFileLocation,
  ];
}