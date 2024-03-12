import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tv_maze/model/shows%20model/shows_model.dart';
import 'package:tv_maze/views/cast/cast_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.show}) : super(key: key);

  final ShowsModel show;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(size.width / 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(show.image.original),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Summary:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              show.summary,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Genres:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: show.genres.map((genre) {
                return Chip(
                  label: Text(
                    genre.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.teal,
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Runtime:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${show.runtime} minutes',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Premiered:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              DateFormat('dd-MM-yyyy').format(show.premiered),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Language:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              show.language.toString(),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Status:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              show.status.toString(),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CastScreen(id: show.id),
                  ));
                },
                child: const Text('View Cast'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
