pub fn square_of_sum(n: u32) -> u32 {
    let sum = (1..n + 1).fold(0, |a, b| a + b);
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    (1..n + 1).fold(0, |a, b| a + b * b)
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
