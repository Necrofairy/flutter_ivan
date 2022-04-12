const firstNum = 15;
const secondNum = -22;
void main() {
  int res1 = firstNum - secondNum;
  int res2 = reverceNum(firstNum) - secondNum;
  int res3 = firstNum - reverceNum(secondNum);
  int res4 = reverceNum(firstNum) - reverceNum(secondNum);
  int result = res1;
  if (res2 > result) result = res2;
  if (res3 > result) result = res3;
  if (res4 > result) result = res4;
  print(result);
}

int reverceNum(int number) {
  String result = number.toString();
  StringBuffer sb = StringBuffer();
  for(int index = result.length - 1; index >= 0; index--) {
    sb.write(result[index]);
  }
  String parse = sb.toString();
  if (parse[parse.length - 1] == '-') {
    sb.clear();
    sb.write('-');
    for(int i = 0; i < parse.length - 1; i++) {
      sb.write(parse[i]);
    }
  }
  return int.parse(sb.toString());
}