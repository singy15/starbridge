package jmockitSample;

public class Logic {
  Calc calc;

  Logic(Calc calc) {
    this.calc = calc;
  }
  /**割り切れる数字のペアをアトランダムに返す。*/
  int[] getDivisibleNumbers() {
    while (true) {
      int candidate = (int) (Math.random() * 100) + 1;
      int candidate2 = (int) (Math.random() * 10) + 1;
      if (calc.remainder(candidate, candidate2) == 0) {
        return new int[]{candidate, candidate2};
      }
    }
  }
}