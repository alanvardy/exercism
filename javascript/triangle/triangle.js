function Triangle(first, second, third) {
  this.first = first;
  this.second = second;
  this.third = third;

  this.kind = function () {
    if (first === second && second === third) {
      return 'equilateral';
    };
  };
}

export { Triangle as
  default,}
