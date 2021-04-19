import 'package:cloud_firestore/cloud_firestore.dart';

class evaluationform {
  //Q1
  Future Punctuality(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'punctuality': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'punctuality': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q2
  Future Appropriate(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'appropriate attire as described in ‘Critical PPM’': '1'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q3
  Future Proper(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'proper bench cleanliness': '1'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q4
  Future Tray(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'tray organization': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'tray organization': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q5
  Future Understanding(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'understanding the indications, relevant anatomy, material selection, technique of procedure':
              '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'understanding the indications, relevant anatomy, material selection, technique of procedure':
              '2'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q6
  Future WithStaff(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'with Staff': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'with Staff': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q7
  Future Benches(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'benches & instrument cleanliness and waste disposals': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'benches & instrument cleanliness and waste disposals': '2'});
      } else if (value == 'NA/NO') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'benches & instrument cleanliness and waste disposals': 'NA/NO'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q8
  Future Adherence(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'adherence to school’s ‘Code of Professional Conduct’': '1'});
      }
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
  Future PreparationSA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Self Assessment': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Self Assessment': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Self Assessment': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Self Assessment': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q2
  Future SyringeSA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Self Assessment': '0'
        });
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Self Assessment': '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Self Assessment': '2'
        });
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Self Assessment':
              'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q3
  Future OperatorSA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Self Assessment': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Self Assessment': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Self Assessment': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Self Assessment': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q4
  Future IdentificationSA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Self Assessment': '0'
        });
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Self Assessment': '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Self Assessment': '2'
        });
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Self Assessment':
              'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q5
  Future NeedleSA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'needle insertion point / Self Assessment': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'needle insertion point / Self Assessment': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'needle insertion point / Self Assessment': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({'needle insertion point / Self Assessment': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q6
  Future AnatomySA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Self Assessment': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Self Assessment': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Self Assessment': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Self Assessment': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q7
  Future abilitySA(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Self Assessment': '0'
        });
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Self Assessment': '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Self Assessment': '2'
        });
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Self Assessment': 'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Instructor Evaluation
// Q1
  Future PreparationIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Instructor Evaluation': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Instructor Evaluation': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Instructor Evaluation': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'preparation of armamentarium / Instructor Evaluation': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Q2
  Future SyringeIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Instructor Evaluation':
              '0'
        });
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Instructor Evaluation':
              '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Instructor Evaluation':
              '2'
        });
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'syringe assembly for injection and aspiration / Instructor Evaluation':
              'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q3
  Future OperatorIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Instructor Evaluation': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Instructor Evaluation': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Instructor Evaluation': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'operator & Manikin positions / Instructor Evaluation': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q4
  Future IdentificationIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Instructor Evaluation':
              '0'
        });
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Instructor Evaluation':
              '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Instructor Evaluation':
              '2'
        });
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'identification soft and hard tissue landmarks / Instructor Evaluation':
              'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q5
  Future NeedleIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'needle insertion point / Instructor Evaluation': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'needle insertion point / Instructor Evaluation': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'needle insertion point / Instructor Evaluation': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'needle insertion point / Instructor Evaluation': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q6
  Future AnatomyIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Instructor Evaluation': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Instructor Evaluation': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'anatomy & injection procedure / Instructor Evaluation': '2'});
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'anatomy & injection procedure / Instructor Evaluation': 'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Q7
  Future abilityIE(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Instructor Evaluation': '0'
        });
      } else if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Instructor Evaluation': '1'
        });
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Instructor Evaluation': '2'
        });
      } else if (value == 'NA') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData({
          'ability to assess success of anesthesia / Instructor Evaluation':
              'NA'
        });
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //IV
  Future overall(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'student’s overall ability to perform the protective': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'student’s overall ability to perform the protective': '2'});
      } else if (value == '3') {
        Firestore.instance
            .collection('omr312PreClinc')
            .document(uid)
            .updateData(
                {'student’s overall ability to perform the protective': '3'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
