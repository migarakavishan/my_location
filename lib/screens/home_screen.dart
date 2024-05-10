import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_location/services/gps_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GpsService.determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          Position position = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Latitude - ${position.latitude}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text('Longitude - ${position.longitude}',
                    style: const TextStyle(fontSize: 24))
              ],
            ),
          );
        },
      ),
    );
  }
}
