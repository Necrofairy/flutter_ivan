List<int> row = [1, 3, 0, 4, 3, 6, -5];
void main() {
  if (row.length < 3) throw Error();
  row.sort();
  row.reversed;
  int firstNum = row[row.length - 1];
  int secondNum = row[row.length - 2];
  int thirdNum = row[row.length - 3];
  print(firstNum * secondNum * thirdNum);
}