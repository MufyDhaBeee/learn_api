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
// body: Column(
//   children: [
//     Center(
//       child: FutureBuilder<Weather>(
//         future: fetchWeather(),
//         builder: (context, snapshot) {
//           final weatherData=snapshot.data;
//           if (snapshot.hasData) {
//             return Column(
//               children: [
//                 Text(weatherData!.forecastDaily!.days![0].forecastStart.toString()),
//                 Text(weatherData.forecastDaily!.days![0].forecastEnd.toString()),
//                 Text(weatherData.forecastDaily!.days![0].conditionCode.toString()),
//                 Text(weatherData.forecastDaily!.days![0].precipitationChance.toString()),
//                 Text(weatherData.forecastDaily!.days![0].precipitationAmount.toString()),
//                 Text(weatherData.forecastDaily!.days![0].precipitationType.toString()),
//                 Text(weatherData.forecastDaily!.days![0].maxUvIndex.toString()),
//                 Text(weatherData.forecastDaily!.days![0].snowfallAmount.toString()),
//                 Text(weatherData.parameters!.latitude.toString()),
//                 Text(weatherData.parameters!.longitude.toString()),
//                 Text(weatherData.resource.toString()),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//
//           // By default, show a loading spinner.
//           return const CircularProgressIndicator();
//         },
//       ),
//     ),
//
//   ],
// ),