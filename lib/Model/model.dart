class SchoolModel {
  String schoolName;
  String schoolAddress;
  String numOfStudents;
  String numOfTeachers;

  SchoolModel({
    required this.schoolName,
    required this.schoolAddress,
    required this.numOfStudents,
    required this.numOfTeachers,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      schoolName: json['School Name'] ?? 'School Name',
      schoolAddress: json['School Address'] ?? 'School Address',
      numOfStudents: json['Number of Students'] ?? 'Number of Students',
      numOfTeachers: json['Number of Teachers'] ?? 'Number of Teachers',
    );
  }
}
