import 'package:equatable/equatable.dart';

class Video extends Equatable{
  String videoTitle;
  String videoUrl;
  String likeNum;
  String commentNum;
  String logoLetter;
  String userId;
  String songPosterUrl;
  String songName;

  Video({
    required this.videoTitle,
    required this.videoUrl,
    required this.likeNum,
    required this.commentNum,
    required this.logoLetter,
    required this.userId,
    required this.songPosterUrl,
    required this.songName,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoTitle: json['videoTitle'],
      videoUrl: json['videoUrl'],
      likeNum: json['likeNum'],
      commentNum: json['commentNum'],
      logoLetter: json['logoLetter'],
      userId: json['userId'],
      songPosterUrl: json['songPosterUrl'],
      songName: json['songName'],
    );
  }

  @override
  List<Object?> get props => [videoTitle,videoUrl,likeNum,commentNum,logoLetter,userId,songPosterUrl,songName];
}
