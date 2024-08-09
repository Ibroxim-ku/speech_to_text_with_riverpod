import 'package:flutter/material.dart';

@immutable
sealed class AppImages {
  const AppImages._();
  static final settingIcon = Image.asset(
    "assets/icons/seetings_icon.png",
    height: 20,
    width: 22,
    fit: BoxFit.cover,
  );
  static final voiceIcon = Image.asset(
    "assets/icons/voice_icon.jpg",
    height: 20,
    width: 22,
    fit: BoxFit.cover,
  );

   static final recordVoiceIcon = Image.asset(
    "assets/icons/record_voice.png",
    height: 20,
    width: 22,
    fit: BoxFit.cover,
  );
}

extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      Image(
        image: image,
        width: width ?? this.width,
        height: height ?? this.height,
        fit: fit ?? this.fit,
        color: color ?? this.color,
      );
}
