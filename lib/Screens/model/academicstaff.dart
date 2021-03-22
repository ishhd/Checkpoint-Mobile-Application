class AcademicStaff {
  String academicid;
  String adminid;
  String academicname;
  String academicemail;
  String academicpassword;

  AcademicStaff(
      {this.academicid,
      this.adminid,
      this.academicname,
      this.academicemail,
      this.academicpassword});

  AcademicStaff.fromMap(Map snapshot, String academicid)
      : academicid = academicid ?? '',
        adminid = snapshot['adminid'] ?? '',
        academicname = snapshot['academicname'] ?? '',
        academicemail = snapshot['academicemail'] ?? '',
        academicpassword = snapshot['academicpassword'] ?? '';

  toJson() {
    return {
      "adminid": adminid,
      "academicname": academicname,
      "academicemail": academicemail,
      "academicpassword": academicpassword
    };
  }
}
