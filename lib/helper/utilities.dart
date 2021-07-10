double stringToDouble(String x) {
  return double.parse(x.replaceAll(RegExp('[,]'), ''));
}
