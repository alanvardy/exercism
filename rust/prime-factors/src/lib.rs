pub fn factors(n: u64) -> Vec<u64> {
    let mut factors = Vec::new();
    let mut number = n;

    while number > 1 {
        let lowest_factor: u64 = get_lowest_factor(&number);
        factors.push(lowest_factor);
        number = number / lowest_factor;
    }

    factors
}

fn get_lowest_factor(number: &u64) -> u64 {
    let mut factor = 2;
    loop {
        if number % factor == 0 {
            break;
        } else {
            factor += 1;
        }
    }

    factor
}
