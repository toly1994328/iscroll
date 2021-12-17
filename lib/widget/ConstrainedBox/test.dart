main(){
  int a  = 10.clamp(3, 6); // 6
  int b  = 4.clamp(3, 6); // 4
  int c  = 1.clamp(3, 6); // 3

  print('$a,$b,$c');
}