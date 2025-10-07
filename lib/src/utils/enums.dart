enum Grade {
  notGraded('Not yet graded'),
  aPlus('A+'),
  a('A'),
  bPlus('B+'),
  b('B'),
  cPlus('C+'),
  c('C'),
  dPlus('D+'),
  d('D'),
  ePlus('E+'),
  e('E'),
  fPlus('F+'),
  f('F');

  final String value;

  const Grade(this.value);

  static Grade fromString(String value) {
    return Grade.values.firstWhere((g) => g.value == value);
  }

  @override
  String toString() {
    return value;
  }
}

enum OrderMode { asc, desc }
