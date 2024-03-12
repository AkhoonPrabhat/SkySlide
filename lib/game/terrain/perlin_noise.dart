import 'dart:core';
import 'dart:math';

class PerlinNoise {
  List<double> cerp(double x1, double x2, [double t = 0.1]) {
    List<double> tmp = [];
    double val;
    for (double i = 0; i < 1; i += t) {
      val = _blend(i);
      tmp.add((1 - val) * x1 + val * x2);
    }
    return tmp;
  }

  List<double> noise1D(
      {int octaves = 2,
      double persistence = 0.04,
      int n = 80,
      double dt = 0.1,
      int lacunarity = 2,
      int? seed = 0}) {
    List<double> tmp =
        _interpolatedRandomArr(_generateRandomArr(n, seed ?? 0), dt);

    List<double> res = List.generate(tmp.length, (index) => 0.0);
    double sum = 0.0;
    for (int i = 0; i < tmp.length; i++) {
      for (int j = 0; j < octaves; j++) {
        sum += tmp[(pow(lacunarity, j) * i % tmp.length).toInt()] *
            pow(persistence, j);
      }
      res[i] = sum;
      sum = 0.0;
    }

    return res;
  }

  List<double> _generateRandomArr(int n, [int seed = 0]) {
    List<double> lst = List.generate(n, (index) => 0.0);
    for (int i = 0; i < n; i++) {
      lst[i] = Random(seed * n + i).nextDouble();
    }
    return lst;
  }

  List<double> _interpolatedRandomArr(List<double> arr, double dt) {
    int n = arr.length;
    List<double> lst = [];
    int j = 1;
    while (j < n - 2) {
      lst.addAll(cerp(arr[j - 1], arr[j], dt));
      j += 1;
    }
    return lst;
  }

  double _blend(double t) {
    return (1 - cos(pi * t)) / 2;
  }
}

final perlinNoise = PerlinNoise();
