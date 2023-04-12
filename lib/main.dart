import 'dart:math' as math;

void main() {
  var sum, cnt, facevalue = 0;

  while(sum<100){
    facevalue = rolldice();
    sum = sum + facevalue;
    cnt++;
    print('$cnt번째 주사위의 눈은 $facevalue이며 현재 총합은 $sum입니다.');
  }

  print('누적합이 100을 넘기려면 주사위를 $cnt번 굴려야 합니다.');

}

int rolldice(){
  var rand = math.Random();
  int facevalue = rand.nextInt(6)+1;

  return facevalue;
}