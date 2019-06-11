import 'package:flutter/foundation.dart';

import '../../SampleData.dart';

class HomeModel with ChangeNotifier {
  Data _data = Data();

  Data get data => _data;

  set data(Data value) {
    _data = value;
    notifyListeners();
  }
}
