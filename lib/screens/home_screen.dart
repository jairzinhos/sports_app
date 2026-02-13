import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers/connectivity_provider.dart';
import 'no_internet_screen.dart';
import 'channel_list_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connection = ref.watch(connectivityProvider);

    return connection.when(
      data: (isConnected) {
        if (!isConnected) {
          return NoInternetScreen();
        }
        return ChannelListScreen();
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, __) => NoInternetScreen(),
    );
  }
}
