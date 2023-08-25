class UserModel {
  const UserModel({
    required this.name,
    required this.age,
    required this.professions,
  });

  final String name;
  final int age;
  //no se debe guardar la edad. Se debe guardar la fecha de nac
  //y calcular la edad
  final List<String> professions;

  UserModel copyWith({
    String? name,
    int? age,
    List<String>? professions,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      professions: professions ?? this.professions,
    );
  }
}
