import 'package:cloud_firestore/cloud_firestore.dart';

class evaluationform {
  Future Punctuality(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Punctuality': 1});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Punctuality': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Appropriate(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData(
                {'Appropriate attire as described in ‘Critical PPM’': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData(
                {'Appropriate attire as described in ‘Critical PPM’': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Proper(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Proper bench cleanliness': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Proper bench cleanliness': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future bility(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'bility to assess success of anesthesia': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'bility to assess success of anesthesia': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Anatomy(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Anatomy & injection procedure': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Anatomy & injection procedure': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Needle(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Needle insertion point': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Needle insertion point': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Operator(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Operator & Manikin positions': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Operator & Manikin positions': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Preparation(String uid, String value) async {
    try {
      if (value == '0') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Preparation of armamentarium': '0'});
      } else if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Preparation of armamentarium': '1'});
      }
      else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Preparation of armamentarium': '2'});
      }
      else if (value == 'NA') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Preparation of armamentarium': 'NA'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Syringe(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Syringe assembly for injection and aspiration': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Syringe assembly for injection and aspiration': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Identification(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Identification soft and hard tissue landmarks': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Identification soft and hard tissue landmarks': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Student(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Student is defensive': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Student is defensive': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future feedback(String uid, String value) async {
    try {
     
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Student is receptive	to	 feedback': value});
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Above(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Above Expectation': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Above Expectation': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Competent(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Competent': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Competent': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Needs(String uid, String value) async {
    try {
      if (value == '1') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Needs improvement': '1'});
      } else if (value == '2') {
        Firestore.instance
            .collection('evaluationForm')
            .document(uid)
            .updateData({'Needs improvement': '2'});
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
