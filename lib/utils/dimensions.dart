class NeovoDimensions {
  static double padding = 8;

  final double height;
  final double clockDiameter;

  NeovoDimensions(this.height)
      : clockDiameter = (height * 0.85) - (padding * 2);

  double get clockRadius => clockDiameter / 2;

  double get clockOffset => clockRadius + padding;

  double get fontSize => clockRadius / 2;
}
