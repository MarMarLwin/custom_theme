/*
Find Intersection
Have the function FindIntersection(strArr) read the array of strings stored
in strArr which will contain 2 elements: the first element will represent a list of 
comma-separated numbers sorted in ascending order, the second element will represent 
a second list of comma-separated numbers (also sorted). Your goal is to return a comma-separated string containing the numbers that occur in elements of strArr in sorted order. If there is no intersection, return the string false.
*/

String FindIntersection(List strArr) {

  var firstArr=strArr[0].split(',').map(int.parse).toList();
  var secondArr=strArr[1].split(',').map(int.parse).toList();

int i=0,j=0;
List<int> intersection=[];

  while(i<firstArr.length && j<secondArr.length){
    if(firstArr[i]==secondArr[j]){
      intersection.add(firstArr[i]);
      i++;
      j++;
    }else if(firstArr[i]<secondArr[j]){
      i++;
    }else{
    j++;
    }
   
  }

return intersection.isEmpty?'false':intersection.join(',');
}
   
// keep this function call here 
void main() {
  print(FindIntersection(["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]));
}

