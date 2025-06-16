import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/utility/utility.dart';

// ✅ Replace with your actual base URL
const String BaseURL = "https://flutter-backend-all-api.onrender.com/api/v1";



// ✅ Toast helpers (mocked for now)
void SuccessToast(String msg) {
  print("✅ $msg");
}

void ErrorToast(String msg) {
  print("❌ $msg");
}

// ✅ API Call Function
Future<Map<String, dynamic>> DashBoardSummary() async {
  var URL = Uri.parse("${BaseURL}/taskStatusCount");
  var token = await GetUserData('token');
  var userId = await GetUserData('userId');

  var headers = {
    "Content-Type": "application/json",
    "token": token ?? "",
    "userId": userId ?? "",
  };

  var response = await http.get(URL, headers: headers);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Task List Request Success");
    return ResultBody['data'];
  } else {
    ErrorToast("Request fail! try again");
    return {
      "New": "0",
      "Progress": "0",
      "Completed": "0",
      "Canceld": "0",
    };
  }
}

// ✅ UserHome Widget
class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int newCount = 0;
  int progressCount = 0;
  int completedCount = 0;
  int CanceldCount = 0;

  bool isLoading = false;

  int parseCount(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Future<void> loadDashboardSummary() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await DashBoardSummary();

      setState(() {
        newCount = parseCount(result["New"]);
        progressCount = parseCount(result["Progress"]);
        completedCount = parseCount(result["Completed"]);
        CanceldCount = parseCount(result["Canceld"]);
        isLoading = false;
      });
    } catch (e) {
      ErrorToast("Exception: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadDashboardSummary();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> taskCounts = [newCount, progressCount, completedCount, CanceldCount];
    final List<String> taskLabels = ["New", "Progress", "Completed", "Canceld"];
    final List<Color> taskColors = [
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.green,
      Colors.redAccent,
    ];

    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return _summaryTile(taskLabels[index], taskCounts[index], taskColors[index]);
                    }),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 250,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: (taskCounts.reduce((a, b) => a > b ? a : b) * 1.2).toDouble(),
                        barTouchData: BarTouchData(enabled: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                int index = value.toInt();
                                if (index >= 0 && index < taskLabels.length) {
                                  return Text(taskLabels[index], style: const TextStyle(fontSize: 12));
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: FlGridData(show: true),
                        borderData: FlBorderData(show: false),
                        barGroups: List.generate(4, (index) {
                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: taskCounts[index].toDouble(),
                                color: taskColors[index],
                                width: 20,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _summaryTile(String title, int count, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "$count",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
