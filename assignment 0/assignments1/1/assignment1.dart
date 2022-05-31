const input = 5;
void main() {
  int? result = calculateFactorial(input);
  print(result);
}

int? calculateFactorial(int? input) {
  if (input == null || input < 0 || input >= 1000) return null;
  if (input == 0) return 1;
  int result = 1;
  for(int i = 1; i <= input; i++) {
    result *= i;
  }
  return result;
}



