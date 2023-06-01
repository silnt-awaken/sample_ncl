const sky = 'Sky';
const bliss = 'Bliss';
const escape = 'Escape';

enum ShipName {
  sky('Norwegian Sky'),
  bliss('Norwegian Bliss'),
  escape('Norwegian Escape');

  final String fullName;
  const ShipName(this.fullName);
}
