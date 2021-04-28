import 'package:cloud_firestore/cloud_firestore.dart';

class evaluationform {
  final CollectionReference evaluationForm1 =
      Firestore.instance.collection('omr312PreClinc');
  //Q1
  Future punctuality(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData({'punctuality': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q2
  Future appropriate(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData(
          {'appropriate attire as described in ‘Critical PPM’': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q3
  Future proper(String uid, String value) async {
    try {
      evaluationForm1
          .document(uid)
          .updateData({'proper bench cleanliness': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q4
  Future tray(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData({'tray organization': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q5
  Future understanding(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData({
        'understanding the indications, relevant anatomy, material selection, technique of procedure':
            value
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q6
  Future withStaff(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData({'with Staff': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q7
  Future benches(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData(
          {'benches & instrument cleanliness and waste disposals': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q8
  Future adherence(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData(
          {'adherence to school’s ‘Code of Professional Conduct’': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q9
  Future feedback(String uid, String value) async {
    try {
      Firestore.instance
          .collection('omr312PreClinc')
          .document(uid)
          .updateData({'feedback': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// II
// Self Assessment
// Q1
  Future preparationSA(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData(
          {'preparation of armamentarium / Self Assessment': value});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q2
  Future syringeSA(String uid, String value) async {
    try {
      evaluationForm1.document(uid).updateData({
        'syringe assembly for injection and aspiration / Self Assessment': value
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q3
  Future operatorSA(String uid, String value) async {
    evaluationForm1
        .document(uid)
        .updateData({'operator & Manikin positions / Self Assessment': value});
  }

//Q4
  Future identificationSA(String uid, String value) async {
    evaluationForm1.document(uid).updateData({
      'identification soft and hard tissue landmarks / Self Assessment': value
    });
  }

//Q5
  Future needleSA(String uid, String value) async {
    evaluationForm1
        .document(uid)
        .updateData({'needle insertion point / Self Assessment': value});
  }

//Q6
  Future anatomySA(String uid, String value) async {
    evaluationForm1
        .document(uid)
        .updateData({'anatomy & injection procedure / Self Assessment': value});
  }

//Q7
  Future abilitySA(String uid, String value) async {
    evaluationForm1.document(uid).updateData(
        {'ability to assess success of anesthesia / Self Assessment': value});
  }

  // Instructor Evaluation
// Q1
  Future preparationIE(String uid, String value) async {
    evaluationForm1.document(uid).updateData(
        {'preparation of armamentarium / Instructor Evaluation': value});
  }

  //Q2
  Future syringeIE(String uid, String value) async {
    evaluationForm1.document(uid).updateData({
      'syringe assembly for injection and aspiration / Instructor Evaluation':
          value
    });
  }

//Q3
  Future operatorIE(String uid, String value) async {
    evaluationForm1.document(uid).updateData(
        {'operator & Manikin positions / Instructor Evaluation': value});
  }

//Q4
  Future identificationIE(String uid, String value) async {
    evaluationForm1.document(uid).updateData({
      'identification soft and hard tissue landmarks / Instructor Evaluation':
          value
    });
  }

//Q5
  Future needleIE(String uid, String value) async {
    evaluationForm1
        .document(uid)
        .updateData({'needle insertion point / Instructor Evaluation': value});
  }

//Q6
  Future anatomyIE(String uid, String value) async {
    evaluationForm1.document(uid).updateData(
        {'anatomy & injection procedure / Instructor Evaluation': value});
  }

//Q7
  Future abilityIE(String uid, String value) async {
    evaluationForm1.document(uid).updateData({
      'ability to assess success of anesthesia / Instructor Evaluation': value
    });
  }

  //IV
  Future overall(String uid, String value) async {
    evaluationForm1.document(uid).updateData(
        {'student’s overall ability to perform the protective': value});
  }
}
