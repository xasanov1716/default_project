part of 'downloader_cubit.dart';

class DownloaderState  {
  const DownloaderState({
    required this.progress,
    required this.myStream,
  });

  final double progress;
  final StreamController<double> myStream;

  DownloaderState copyWith({
    double? progress,
    StreamController<double>? myStream,
  }) =>
      DownloaderState(
        progress: progress ?? this.progress,
        myStream: myStream ?? this.myStream,
      );
}
