class FormValidator {
  static String? Function(String?) email = (value) {
    final bool isEmail = RegExp(r'^(([^<>()[]\.,;:\s@"]+(.[^<>()[]\.,;:\s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$').hasMatch(value!);

    if (!isEmail) {
      return "รูปแบบอีเมลไม่ถูกต้อง";
    }

    return null;
  };

  static String? Function(String?) username = (value) {
    if (value == null || value.isEmpty) {
      return "กรุณาระบุรหัสผู้ใช้";
    }

    return null;
  };

  static String? Function(String?) password = (value) {
    if (value == null || value.isEmpty) {
      return "กรุณาระบุรหัสผ่าน";
    }

    if (value.length < 8) {
      return "รหัสผ่านต้องประกอบไปด้วยอักขระอย่างน้อย 8 ตัว";
    }

    return null;
  };
}
