import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers/connectivity_provider.dart';

class ConnectionBanner extends ConsumerWidget {
  const ConnectionBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connection = ref.watch(connectivityProvider);

    return connection.when(
      data: (isConnected) {
        if (isConnected) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          color: Colors.red,
          padding: const EdgeInsets.all(8),
          child: const Text(
            '⚠ Sin conexión a internet',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
