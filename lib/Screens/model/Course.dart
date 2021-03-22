class Course {
  String courseNumber;
  String courseName;
  String clincNumber;
  String courseSupervisor;

  Course(
      {this.courseNumber,
      this.courseName,
      this.clincNumber,
      this.courseSupervisor});

  Course.fromMap(Map snapshot, String courseNumber)
      : courseNumber = courseNumber ?? '',
        courseName = snapshot['courseName'] ?? '',
        clincNumber = snapshot['clincNumber'] ?? '',
        courseSupervisor = snapshot['courseSupervisor'] ?? '';

  toJson() {
    return {
      "courseName": courseName,
      "courseSupervisor": courseSupervisor,
      "courseNumber": courseNumber,
      "clincNumber": clincNumber
    };
  }
}
