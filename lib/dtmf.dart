import 'dart:async';
import 'package:flutter/services.dart';

/// Dtmf enables playing DTMF tones crossplatform
class Dtmf {
  static const MethodChannel _channel = const MethodChannel('flutter_dtmf');

  /// Plays the DTMF Tones Associated with the [digits]. Each tone is played for the duration [durationMs] in milliseconds
  /// at the specified volume. If no volume is specified, the system default is used. Volume value should be between
  /// 0 and 1.
  /// Returns true if tone played successfully
  /// By default is Dtmf is disabled on the device, it will not play the sound. If you want to force play the sound, set "ignoreDtmfSettings" to true

  static Future<bool?> playTone(
      {required String digits,
      int? durationMs,
      double? samplingRate,
      double? volume,
        bool? ignoreDtmfSettings}) async {
    if (samplingRate == null) {
      samplingRate = 500;
    }
    if (durationMs == null) {
      durationMs = 160;
    }
    if(ignoreDtmfSettings == null){
      ignoreDtmfSettings = false ;
    }
    final Map<String, Object?> args = <String, dynamic>{
      "digits": digits,
      "samplingRate": samplingRate,
      "durationMs": durationMs,
      "volume": volume,
      "ignoreDtmfSettings":ignoreDtmfSettings
    };
    return await _channel.invokeMethod('playTone', args);
  }
}
