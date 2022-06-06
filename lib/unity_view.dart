import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityView extends StatefulWidget {
  const UnityView({Key? key}) : super(key: key);

  @override
  State<UnityView> createState() => _UnityViewState();
}

class _UnityViewState extends State<UnityView> {
  UnityWidgetController? unityController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Unity View"),
      ),
      body: UnityWidget(
        onUnityCreated: _onUnityCreated,
        onUnityMessage: _onUnityMessage,
        runImmediately: true,
        fullscreen: false,
      ),
    );
  }

  void _onUnityCreated(controller) {
    unityController = controller;
    //.pause() & .resume() are to avoid issue with white screen
    //on unity initialization until version is pushed by package creator that solves it
    //(the creator of the package is aware of this issue and is working on it)
    unityController?.pause();
    sleep(const Duration(milliseconds: 100));
    unityController?.resume();
  }

  void _onUnityMessage(message) {
    // ignore: avoid_print
    print("Message Received by Flutter: ${message.toString()}");

    switch (message) {
      case 'Maps Loaded':
        unityController?.postMessage('ARWAYSDK', 'GetMapId', '812635-Office');
        break;
      case 'Ready to Localize':
        unityController?.postMessage('ARWAYSDK', 'AdvanceDemo', '');
        break;
      case 'Anchor Located':
        unityController?.postMessage(
            'ARWAYSDK', 'HandleDestinationSelection', 'Colton Cube Dest');
        break;
    }
  }
}
