String getString(String phone){
  String newPhone="+998 (${phone.substring(3,5)}) ${phone.substring(5,8)}-${phone.substring(8,10)}-${phone.substring(10)}";
  return newPhone;
}

String changeString(String phone){
  String newPhone="998${phone.substring(6,8)}${phone.substring(10,13)}${phone.substring(14,16)}${phone.substring(17)}";
  return newPhone;
}