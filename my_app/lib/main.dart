import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(home: Airreport(), debugShowCheckedModeBanner: false),
  );
}

class Airreport extends StatefulWidget {
  const Airreport({super.key});

  @override
  State<Airreport> createState() => _AirreportState();
}

class _AirreportState extends State<Airreport> {
  int? aqi;
  String? city;
  double? temp;
  double? humidity;
  double? pressure;
  bool isLoading = true;
  String? errorMessage;
  
  final String token = 'e3527cb8245efc45ebbb672a078db66d43abc991';
  String selectedCity = 'Bangkok';

  Color aqiColor(int aqi) {
    if (aqi == null) return Colors.grey;
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow.shade700;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    if (aqi <= 300) return Colors.purple;
    return Colors.brown.shade900;
  }

  String getAqiStatus(int aqi) {
    if (aqi == null) return "ไม่มีข้อมูล";
    if (aqi <= 50) return "ดีมาก";
    if (aqi <= 100) return "ปานกลาง";
    if (aqi <= 150) return "ไม่ดีสำหรับกลุ่มเสี่ยง";
    if (aqi <= 200) return "ไม่ดีสำหรับทุกคน";
    if (aqi <= 300) return "อันตราย";
    return "อันตายมาก";
  }

  IconData getAQIIcon(int? aqiValue) {
    if (aqiValue == null) return Icons.help_outline;
    if (aqiValue <= 50) return Icons.air;
    if (aqiValue <= 100) return Icons.airport_shuttle;
    if (aqiValue <= 150) return Icons.thumb_down;
    if (aqiValue <= 200) return Icons.dangerous;
    return Icons.sentiment_very_dissatisfied;
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final url = "https://api.waqi.info/feed/$selectedCity/?token=$token";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["status"] == "ok") {
          setState(() {
            aqi = data["data"]["aqi"];
            city = data["data"]["city"]["name"];
            temp = data["data"]["iaqi"]["t"]?["v"]?.toDouble();
            humidity = data["data"]["iaqi"]["h"]?["v"]?.toDouble();
            pressure = data["data"]["iaqi"]["p"]?["v"]?.toDouble();
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = "ไม่สามารถดึงข้อมูลได้";
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage = "เกิดข้อผิดพลาด: ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "ไม่สามารถเชื่อมต่อได้";
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1a2a6c), Color(0xFFb21f1f), Color(0xFFfdbb2d)],
          ),
        ),

        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 120,
              child: Container(
                width: 700,
                height: 800,
                decoration: BoxDecoration(
                  color: aqiColor(aqi ?? 0).withOpacity(0.6),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -20),
                        child: Text(
                          "${aqi ?? "-"}",
                          style: const TextStyle(
                            fontSize: 350,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 0),
                        child: Text(
                          getAqiStatus(aqi ?? 0),
                          style: TextStyle(
                            fontSize: 150,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 200,
              right: 120,
              child: Container(
                width: 900,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -20),
                        child: Text(
                          "$selectedCity",
                          style: const TextStyle(
                            fontSize: 130,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 500,
              right: 265,
              child: Container(
                width: 600,
                height: 290,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thermostat, size: 55),
                          SizedBox(width: 8),
                          Text(
                            "temperature: $temp",
                            style: const TextStyle(
                              fontSize: 65,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton.icon(
                        onPressed: () {
                          fetchData();
                        },
                        icon: Icon(Icons.refresh),
                        label: Text("refresh"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
