String fullString = 'ababbababa';
String findString = 'aba';
void main() {
  StringBuffer sb = StringBuffer();
  StringBuffer result = StringBuffer();
  for (int i = 0; i < fullString.length; i++) {
    sb.write(fullString[i]);
    if (sb.length == findString.length) {
      i = i - findString.length + 1;
      if (sb.toString() == findString) {
        result.write(i);
        result.write(' ');
      }
      sb.clear();
    }
  }
  print(result);
}