pub fn square(s: u32) -> u64 {
    if 1 <= s && s <= 64 {
        u64::pow(2, s - 1)
    } else {
        panic!("Square must be between 1 and 64")
    }
}

pub fn total() -> u64 {
    square(64) - 1 + square(64)
}
