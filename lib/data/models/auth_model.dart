enum Gender {
  Male,
  Female,
  Other,
}

class SignupUser {
  String name;
  Gender gender;

  SignupUser({
    this.name,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender.toString(),
      };
}
