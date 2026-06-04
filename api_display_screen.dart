import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'album_model.dart';
import 'api_service.dart';


class ApiDisplayScreen extends StatefulWidget {
  const ApiDisplayScreen({super.key});

  @override
  State<ApiDisplayScreen> createState() => _ApiDisplayScreenState();
}

class _ApiDisplayScreenState extends State<ApiDisplayScreen>{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch Data Example')),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: fetchAlbumList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.reversed.first.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
