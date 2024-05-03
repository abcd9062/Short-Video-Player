import 'package:flutter/foundation.dart';

class VideoPlayerViewModel extends ChangeNotifier {
  bool _isTapOnPause = false;
  bool get isTapOnPause => _isTapOnPause;
  setIsTapOnPauseAndNotify(bool value) {
    _isTapOnPause = value;
    notifyListeners();
  }

}