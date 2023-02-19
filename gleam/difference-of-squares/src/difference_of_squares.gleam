import gleam/iterator

pub fn square_of_sum(n: Int) -> Int {
  1
  |> iterator.range(n)
  |> iterator.fold(0, fn(acc, x) {acc + x})
  |> fn(sum){sum * sum}
}

pub fn sum_of_squares(n: Int) -> Int {
  1
  |> iterator.range(n)
  |> iterator.fold(0, fn(acc, x) {acc + x * x})
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
