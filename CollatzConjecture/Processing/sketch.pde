void setup() {
  size(1200, 600);
  background(0);
  for (int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    float len = height/100.0;
    float angle = 0.15;
    resetMatrix();
    translate(width/2, height);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(angle);
      } else {
        rotate(-angle);
      }
      strokeWeight(2);
      stroke(255, 2);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
}
int collatz(int n) {
  // even
  if (n % 2 == 0) {
    return n / 2;
    // odd
  } else {
    return (n * 3 + 1)/2;
  }
}
