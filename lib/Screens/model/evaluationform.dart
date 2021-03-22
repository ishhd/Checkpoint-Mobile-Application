class EvaluationForm {
  String formnumber;
  String formname;
  String coursenumber;
  String adminid;
  String evaluatorname;
  String grade;

  EvaluationForm(
      {this.formnumber,
      this.formname,
      this.coursenumber,
      this.adminid,
      this.evaluatorname,
      this.grade});

  EvaluationForm.fromMap(Map snapshot, String formnumber)
      : formnumber = formnumber ?? '',
        formname = snapshot['formname'] ?? '',
        coursenumber = snapshot['coursenumber'] ?? '',
        adminid = snapshot['adminid'] ?? '',
        evaluatorname = snapshot['evaluatorname'] ?? '',
        grade = snapshot['grade'] ?? '';

  toJson() {
    return {
      "formname": formname,
      "coursenumber": coursenumber,
      "adminid": adminid,
      "evaluatorname": evaluatorname,
      "grade": grade
    };
  }
}
