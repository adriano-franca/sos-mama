import 'package:flutter/material.dart';

import '../core/core.dart';
import 'video.dart';

abstract class CustomContentModel {
  Widget get subtitle;
  Widget get media;

  factory CustomContentModel.fromJson(Map json) {
    final media = json['media'];
    final subtitle = json['subtitle'];
    if (json['type'] == 'image') {
      return CustomImageContentModel(
          imageResouce: media, subtitleResource: subtitle);
    } else {
      return CustomVideoContentModel(
          videoResouce: media, subtitleResource: subtitle);
    }
  }
}

class CustomContent extends StatelessWidget {
  final CustomContentModel? model;

  const CustomContent({super.key, this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        children: <Widget>[
          model!.media,
          UIHelper.smallVerticalSpacer,
          model!.subtitle,
        ],
      ),
    );
  }
}

class CustomImageContentModel implements CustomContentModel {
  final String? imageResouce;
  final String? subtitleResource;

  CustomImageContentModel(
      {required this.imageResouce, required this.subtitleResource});

  @override
  Widget get media => Container(
          child: Image.asset(
        imageResouce!,
        height: 400,
      ));

  @override
  Widget get subtitle => FutureBuilder(
        future: getTextFromTxt(subtitleResource!),
        initialData: '',
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              snapshot.data,
              style: const TextStyle(fontSize: mediumFontSize),
              textAlign: TextAlign.center,
            );
          } else {
            return Container();
          }
        },
      );
}

class CustomVideoContentModel implements CustomContentModel {
  final String? videoResouce;
  final String? subtitleResource;

  CustomVideoContentModel({this.videoResouce, this.subtitleResource});
  @override
  Widget get media => SizedBox(
        width: double.infinity,
        child: Video(
          asset: videoResouce,
        ),
      );

  @override
  Widget get subtitle => FutureBuilder(
        future: getTextFromTxt(subtitleResource!),
        initialData: '',
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              snapshot.data,
              style: const TextStyle(fontSize: mediumFontSize),
              textAlign: TextAlign.center,
            );
          } else {
            return Container();
          }
        },
      );
}
