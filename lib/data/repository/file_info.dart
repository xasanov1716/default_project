import 'package:equatable/equatable.dart';

class FileInfo extends Equatable {
  final String fileName;
  final String fileUrl;
  final double progress;
  final double memory;
  final String time;

  const FileInfo({
    required this.fileName,
    required this.fileUrl,
    required this.progress,
    required this.memory,
    required this.time,
  });

  FileInfo copyWith({
    String? fileName,
    String? fileUrl,
    double? progress,
    double? memory,
    String? time,
  }) =>
      FileInfo(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
        progress: progress ?? this.progress,
        memory: memory ?? this.memory,
        time: time ?? this.time,
      );

  @override
  List<Object?> get props => [
    fileName,
    fileUrl,
    progress,
    memory,
    time,
  ];
}

List<FileInfo> filesData = [
  const FileInfo(
      fileName: "Uz Hits",
      fileUrl: "http://www.classicmusic.uz/media/Shashmaqom/history-&-modernity_1/The%20Keepers%20of%20Maqom%20traditions.wmv",
      progress: 0.0,
      memory: 7.5,
      time: "07:22"
  ),
  const FileInfo(
      fileName: "Kitob",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      progress: 0.0,
      memory: 2.1,
      time: "07:30"
  ),
  const FileInfo(
      progress: 0.0,
      fileName: "Gul",
      fileUrl:
      "https://images.all-free-download.com/footage_preview/mp4/closeup_of_wild_butterfly_in_nature_6891908.mp4",
      memory: 2,
      time: "07:31"
  ),
  const FileInfo(
      progress: 0.0,
      fileName: "Muzika",
      fileUrl:
      "https://muzzona.kz/upload/files/2020-12/sabyan-gambus-rohman-ya-rohman_(muzzona.kz).mp3",
      memory: 3.7,
      time: "07:40"
  ),
  const FileInfo(
      progress: 0.0,
      fileName: "Image",
      fileUrl:
      "https://odam.uz/upload/media/posts/2019-10/21/mashhur-suratkash-ajoyib-rasm-olish-sirlarini-oshkor-qildi_1571694997-b.jpg",
      memory: 0.9,
      time: "07:45"
  ),
  const FileInfo(
      progress: 0.0,
      fileName: "Dаrslik",
      fileUrl:
      "https://foydali-fayllar.uz/wp-content/uploads/2021/04/informatika-test.doc.zip",
      memory: 0.05,
      time: "07:50"
  ),
];