import 'package:flutter/material.dart';
import 'package:tv_maze/controller/services/cast%20services/cast_service.dart';
import 'package:tv_maze/model/cast%20model/cast_model.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final CastService castService = CastService();
    return FutureBuilder<List<CastModel>>(
      future: castService.fetchCast(id.toString()),
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
          List<CastModel>? casts = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cast'),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: casts!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            casts[index].person?.image?.medium.toString()??''),
                      ),
                      title: Text(
                        casts[index].character?.name ?? 'Not Found!',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        casts[index].person?.name?? 'Not Found!',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 97, 97, 97)),
                      ),
                    );
                  }),
            )),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
