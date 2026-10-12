

class Driver {
  final String name;
  final String car;
  final String plate;
  final String phone;
  final double rating;
  final int etaMinutes;

  const Driver({
    required this.name,
    required this.car,
    required this.plate,
    required this.phone,
    required this.rating,
    required this.etaMinutes,
  });

  String get initial => name.substring(0, 1);
}

/// Namuna haydovchi. Keyin serverdan keladi.
const sampleDriver = Driver(
  name: 'Jasur Toshmatov',
  car: 'Chevrolet Cobalt',
  plate: '01 A 777 AA',
  phone: '+998 90 123 45 67',
  rating: 4.8,
  etaMinutes: 8,
);





