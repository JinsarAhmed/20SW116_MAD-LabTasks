import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController cityname = TextEditingController();
  Map<String, dynamic>? weatherData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App using API'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/weather.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Weather App By 20SW116",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: cityname,
                      decoration: InputDecoration(
                          labelText: ("City Name"),
                          suffixIcon: IconButton(
                            onPressed: () {
                              fetchWeatherData(cityname.text);
                            },
                            icon: const Icon(Icons.search),
                          ),
                          hintText: "Enter Name of the City",
                          hintStyle: const TextStyle(color: Colors.black),
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.black), // Border color when focused
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (weatherData != null)
                    DataDisplay(weatherData: weatherData!)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchWeatherData(String cityName) async {
    final String api = '5cbf70bfecc74ac4bd4102512231810';
    final String Url = 'https://api.weatherapi.com/v1/current.json';

    final response = await http.get(Uri.parse('$Url?q=$cityName&key=$api'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        weatherData = data;
      });
    }
  }
}

class DataDisplay extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  DataDisplay({Key? key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'City: ${weatherData['location']['name']}',
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          '${weatherData['current']['temp_c']}°C',
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          '${weatherData['current']['condition']['text']}',
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
