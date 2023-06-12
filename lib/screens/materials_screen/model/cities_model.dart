class CityModel {
  CityModel({
    required this.cities,
  });
  late final List<Cities> cities;
  
  CityModel.fromJson(Map<String, dynamic> json){
    cities = List.from(json['cities']).map((e)=>Cities.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cities'] = cities.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Cities {
  Cities({
    required this.id,
    required this.name,
    required this.state,
  });
  late final String id;
  late final String name;
  late final String state;
  
  Cities.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state'] = state;
    return data;
  }
}