
/*
First Reverse
Have the function FirstReverse(str) take the str parameter being passed and return the string in reversed order.
 For example: if the input string is "Hello World and Coders" then your program should return the string sredoC dna dlroW olleH.
*/
//dart run lib/algorithms/first_reverse.dart

String FirstReverse(String str) {


  return str.split('').reversed.join('');

}
   
// keep this function call here 
void main() {
  print(FirstReverse('coderbyte'));
}
