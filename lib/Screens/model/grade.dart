class Grade {
  String studentid;
  String formnumber;
  String academicid;
  String grade;

  Grade({this.studentid, this.formnumber, this.academicid, this.grade});

  Grade.fromMap(Map snapshot, String studentid)
      : studentid = studentid ?? '',
        formnumber = snapshot['formnumber'] ?? '',
        academicid = snapshot['academicid'] ?? '',
        grade = snapshot['grade'] ?? '';

  toJson() {
    return {"formnumber": formnumber, "academicid": academicid, "grade": grade};
  }
}
