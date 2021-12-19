class CarModel {
  String? engineno;
  String? year;
  String? city;
  String? registered;
  String? price;
  String? color;
  String? model;
  String? make;
  String? version;
  String? kilometers;
  String? fueltype;
  String? transmission;
  String? bodtype;
  String? cartype;
  String? assembly;
  String? enginecapacity;

  CarModel(
      {this.engineno,
      this.year,
      this.city,
      this.registered,
      this.price,
      this.color,
      this.model,
      this.make,
      this.version,
      this.kilometers,
      this.fueltype,
      this.transmission,
      this.bodtype,
      this.cartype,
      this.assembly,
      this.enginecapacity});

  // receiving data from server
  factory CarModel.fromMap(map) {
    return CarModel(
      engineno: map['engineno'],
      year: map['year'],
      city: map['city'],
      registered: map['registered'],
      price: map['price'],
      color: map['color'],
      model: map['model'],
      make: map['make'],
      version: map['version'],
      kilometers: map['kilometers'],
      fueltype: map['fueltype'],
      transmission: map['transmission'],
      bodtype: map['bodtype'],
      cartype: map['cartype'],
      assembly: map['assembly'],
      enginecapacity: map['enginecapacity'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'engineno': engineno,
      'year': year,
      'city': city,
      'registered': registered,
      'price': price,
      'color': color,
      'model': model,
      'make': make,
      'version': version,
      'kilometers': kilometers,
      'fueltype': fueltype,
      'transmission': transmission,
      'bodtype': bodtype,
      'cartype': cartype,
      'assembly': assembly,
      'enginecapacity': enginecapacity,
    };
  }
}
