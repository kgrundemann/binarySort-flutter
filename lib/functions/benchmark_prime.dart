import 'dart:math';

import 'standard_deviation.dart';

Map<String, dynamic> runBenchmarkPrime(
    Function testFunction, int data, int numOfRuns) {
  List<double> runtimes = [];
  List<int> sortedData = [];
  for (int i = 0; i < numOfRuns; i++) {
    Stopwatch stopwatch = Stopwatch()..start();
    sortedData = testFunction(data);
    stopwatch.stop();
    runtimes.add(stopwatch.elapsedMicroseconds.toDouble());
  }
  String results = "Results for $numOfRuns runs:\n";
  results += "Max: ${runtimes.reduce(max)}\n";
  results += "Min: ${runtimes.reduce(min)}\n";
  results +=
      "Average: ${runtimes.reduce((value, element) => value + element) / runtimes.length}\n";
  results += "StdDev: ${standardDeviation(runtimes)}\n";
  return {'results': results, 'sortedData': sortedData};
}
