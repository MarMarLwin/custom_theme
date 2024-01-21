/*
Questions Marks
Have the function QuestionsMarks(str) take the str string parameter,
 which will contain single digit numbers, letters, and question marks, 
 and check if there are exactly 3 question marks between every pair of two numbers 
 that add up to 10. If so, then your program should return the string true, otherwise
  it should return the string false. If there aren't any two numbers that add up to 
  10 in the string, then your program should return false as well.

For example: if str is "arrb6???4xxbl5???eee5" then your program should 
return true because there are exactly 3 question marks between 6 and 4, and 3 question marks between
 5 and 5 at the end of the string.
*/
// String QuestionsMarks(String str) {
//   int index1 = -1, index2 = -1, questionMarksCount = 0;

//   bool checkQuestionMarks(int startIndex, int endIndex) {
//     for (int i = startIndex; i < endIndex; i++) {
//       if (str[i] == '?') questionMarksCount++;
//     }

//     return questionMarksCount == 3;
//   }

//   for (int i = 0; i < str.length; i++) {
//     questionMarksCount = 0;
//     if (str[i].contains(RegExp(r'[0-9]'))) {
//       if (index1 == -1) {
//         index1 = i;
//       } else if (index2 == -1) {
//         index2 = i;
//       }
//     }
   
    
//   }
//    var num1 = int.parse(str[index1]);
//     var num2 = int.parse(str[index2]);
//   return (checkQuestionMarks(index1, index2) && num1 + num2 == 10)
//         ? 'true'
//         : 'false';

 
// }

// // keep this function call here
// void main() {
//   print(QuestionsMarks("9???1???9??1???9")); // "acc?7??sss?3rr1??????5"
// }

String questionsMarks(String str) {
  // Initialize variables to track the positions of numbers and the count of question marks
  int num1Pos = -1, num2Pos = -1;
  int questionMarksCount = 0;

  // Helper function to check if there are exactly 3 question marks between two positions
  bool hasExactly3QuestionMarks(int startPos, int endPos) {
    int count = 0;
    for (int i = startPos + 1; i < endPos; i++) {
      if (str[i] == '?') {
        questionMarksCount++;
      }
    }
    return questionMarksCount == 3;
  }

bool alwaysTrue=false;
  // Iterate through the string
  for (int i = 0; i < str.length; i++) {
    if (str[i].contains(RegExp(r'[0-9]'))) {
      if (num1Pos == -1) {
        num1Pos = i;
      } else if (num2Pos == -1) {
        num2Pos = i;

        // Check if the two numbers add up to 10 and there are exactly 3 question marks between them
        int num1 = int.parse(str[num1Pos]);
        int num2 = int.parse(str[num2Pos]);
        if (num1 + num2 == 10 && hasExactly3QuestionMarks(num1Pos, num2Pos)) {
         alwaysTrue=true;
        }else{
          alwaysTrue=false;
        }

        // Reset positions and question mark count for the next pair
        num1Pos = num2Pos;
        num2Pos = -1;
        questionMarksCount = 0;
      }
    } 
    else if (str[i] == '?') {
      questionMarksCount++;
    }
  }

  // If no pair with numbers adding up to 10 was found, return 'false'
  return alwaysTrue?'true':'false';
}

void main() {
  // Example usage:
  String inputStr = "9???1???9??1???9";
  String result = questionsMarks(inputStr);
  print("Result: $result");
}
