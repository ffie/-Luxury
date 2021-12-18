bool yoonyear(int y) {
  if (y % 4 != 0) {
    return false;
  }
  if (y % 100 != 0) {
    return true;
  }

  if (y % 400 == 0) {
    return true;
  }
  return false;
}

int spaceDay(int e, int t) {
  int a = (e) * 7 + (t + 1);
  return a;
}

double weekDay(int year, int month, int day) {
  return totalDay(year, month, day) % 7;
}

double totalDay(int year, int month, int day) {
  double a = ((year - 1) * 365) +
      ((year - 1) / 4) -
      ((year - 1) / 100) +
      ((year - 1) / 400);
  for (int i = 1; i < month; i++) {
    a += lastDay(year, i);
  }
  return a + day;
}

double lastDay(int year, int month) {
  List<double> endday = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  endday[1] = yoonyear(year) ? 29 : 28;
  return endday[month - 1];
}

int nNowDay(int a, int b, int c) {
  int nDay;

  if (c == 7) {
    nDay = spaceDay(a, b);
  } else {
    nDay = spaceDay(a, b) - c;
  }

  return nDay;
}
