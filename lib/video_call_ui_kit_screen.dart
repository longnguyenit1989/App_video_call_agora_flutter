import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class VideoCallUiKitScreen extends StatefulWidget {
  const VideoCallUiKitScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallUiKitScreen> createState() => _VideoCallUiKitScreenState();
}

class _VideoCallUiKitScreenState extends State<VideoCallUiKitScreen> {

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appId,
      channelName: channelName,
      tempToken: token,
      uid: uid,
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

//Build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora UI Kit'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
              ),
            ],
          ),
        ),
      ),
    );
  }

}