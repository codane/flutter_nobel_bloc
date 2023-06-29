import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nobel/ui/widgets/home_screen_grid_view.dart';
import 'package:flutter_nobel/ui/widgets/home_screen_top.dart';
import '../../common/theme/nobel_palette.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ConnectivityResult _result;
  late StreamSubscription _connectivitySubscription;
  bool hasConnection = false;

  @override
  void initState() {
    _checkInternetConnection();
    _connectionStreaming();
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkInternetConnection() async {
    _result = await Connectivity().checkConnectivity();
    if (_result != ConnectivityResult.none) {
      hasConnection = true;
    } else {
      hasConnection = false;
     _showInternetDialogBox();
    }
  }

  void _showInternetDialogBox() {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
      title: const Text("No internet connection"),
      content: const Text("Check your internet connection"),
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
          _checkInternetConnection();
        }, child: const Text("Try again"))
      ],
    ));
  }

  void _connectionStreaming() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((event) async { 
      _checkInternetConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NobelPalette.nobelGreen,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              SizedBox(
                height: 40,
              ),
              HomeScreenTop(),
              Expanded(
                child: HomeScreenGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}