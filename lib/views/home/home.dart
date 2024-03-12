import 'package:flutter/material.dart';
import 'package:tv_maze/controller/services/show%20services/show_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShowService showService = ShowService();
    showService.fetchShows();
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Text('data'),
      )),
    );
  }
}
