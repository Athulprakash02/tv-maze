import 'package:flutter/material.dart';
import 'package:tv_maze/controller/services/show%20services/show_service.dart';
import 'package:tv_maze/model/shows%20model/shows_model.dart';
import 'package:tv_maze/views/home/widgets/movie_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ShowService showService = ShowService();
    showService.fetchShows();
    return FutureBuilder<List<ShowsModel>>(
        future: showService.fetchShows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            List<ShowsModel>? shows = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Tv Shows',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              body: SafeArea(
                  child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                ),
                itemCount: shows!.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieTileWidget(show: shows[index]);
                },
              )),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
