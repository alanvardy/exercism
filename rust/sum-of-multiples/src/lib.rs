pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit).fold(0, |acc, x| maybe_add(acc, &x, factors))
}

fn maybe_add(acc: u32, x: &u32, factors: &[u32]) -> u32 {
    if factors.iter().any(|&y| y != 0 && x % y == 0) {
        acc + x
    } else {
        acc
    }
}
