class Birthday {
  int? id;
  String name;
  int birthDay;
  int birthMonth;
  int? birthYear;
  List<DateTime>? eventDates;

  Birthday(
      {this.name = "",
      this.birthDay = 0,
      this.birthMonth = 0,
      this.birthYear,
      this.eventDates,
      this.id});

  int getAge(int year) {
    if (birthYear == null || birthYear! > year) return 0;
    return year - birthYear!;
  }

  factory Birthday.fromJson(Map<String, Object?> json) {
    List<DateTime> eventDates = [];

    for (int i = 0; i < 10; i++) {
      eventDates.add(DateTime.utc(
        DateTime.now().year - 5 + i,
        json['BirthMonth'] as int,
        json['BirthDay'] as int,
      ));
    }

    return Birthday(
        id: json['_id'] as int?,
        name: json['Name'] as String,
        birthDay: json['BirthDay'] as int,
        birthMonth: json['BirthMonth'] as int,
        birthYear: json['BirthYear'] as int?,
        eventDates: eventDates);
  }

  Map<String, Object?> toJson() => {
        '_id': id,
        'Name': name,
        'BirthDay': birthDay,
        'BirthMonth': birthMonth,
        'BirthYear': birthYear,
      };
}
