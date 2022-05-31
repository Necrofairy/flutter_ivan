const input = 'aaa';
void main() {
  String s = input.replaceAll(' ', '');
  s = s.toLowerCase();
  s = s.replaceAll(',', '');
  s = s.replaceAll('.', '');
  s = s.replaceAll('!', '');
  s = s.replaceAll('?', '');
  s = s.replaceAll(';', '');
  String reverse = reverseString(s);
  if (s == reverse) {
    print('Yes -> $reverse - $s');
  } else {
    print('No -> $reverse - $s');
  }
}

String reverseString(String s) {
  StringBuffer sb = StringBuffer();
  for(int i = s.length - 1; i >= 0; i--) {
    sb.write(s[i]);
  }
  return sb.toString();
}