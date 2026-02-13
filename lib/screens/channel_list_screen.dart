import 'package:flutter/material.dart';
import '../widgets/connection_banner.dart';
import 'web_player_screen.dart';

class ChannelListScreen extends StatelessWidget {
  const ChannelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de canales')),
      body: Column(
        children: [
          const ConnectionBanner(),

          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('ESPN'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WebPlayerScreen(
                          url: 'https://tvtvhd.com/canales.php?stream=espn',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
