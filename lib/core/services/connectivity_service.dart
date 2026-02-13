import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get connectionStream async* {
    await for (final results in _connectivity.onConnectivityChanged) {
      yield await _hasInternet(results);
    }
  }

  Future<bool> _hasInternet(List<ConnectivityResult> results) async {
    if (results.isEmpty || results.first == ConnectivityResult.none) {
      return false;
    }

    try {
      final response = await InternetAddress.lookup('google.com');
      return response.isNotEmpty && response.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
