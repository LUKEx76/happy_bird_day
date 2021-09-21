class Birthday {
  int? id;
  String name;
  int birthDay;
  int birthMonth;
  int? birthYear;
  DateTime? eventDate;

  Birthday(
      {this.name = "",
      this.birthDay = 0,
      this.birthMonth = 0,
      this.birthYear,
      this.eventDate,
      this.id});

  int get age {
    if (birthYear == null) return 0;
    return DateTime.now().year - birthYear!;
  }

  factory Birthday.fromJson(Map<String, Object?> json) {
    return Birthday(
        id: json['_id'] as int?,
        name: json['Name'] as String,
        birthDay: json['BirthDay'] as int,
        birthMonth: json['BirthMonth'] as int,
        birthYear: json['BirthYear'] as int?,
        eventDate: DateTime.utc(
          DateTime.now().year,
          json['BirthMonth'] as int,
          json['BirthDay'] as int,
        ));
  }

  Map<String, Object?> toJson() => {
        '_id': id,
        'Name': name,
        'BirthDay': birthDay,
        'BirthMonth': birthMonth,
        'BirthYear': birthYear,
      };
}
