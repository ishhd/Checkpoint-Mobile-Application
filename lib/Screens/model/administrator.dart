class Administrator {
  String adminid;
  String adminname;
  String adminemail;
  String adminpassword;

  Administrator(
      {this.adminid, this.adminname, this.adminemail, this.adminpassword});

  Administrator.fromMap(Map snapshot, String adminid)
      : adminid = adminid ?? '',
        adminname = snapshot['adminname'] ?? '',
        adminemail = snapshot['adminemail'] ?? '',
        adminpassword = snapshot['adminpassword'] ?? '';

  toJson() {
    return {
      "adminname": adminname,
      "adminemail": adminemail,
      "adminpassword": adminpassword
    };
  }
}
