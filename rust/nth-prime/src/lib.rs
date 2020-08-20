pub fn nth(n: u32) -> u32 {
    let mut number = 2;
    let mut count = 0;
    let mut primes = Vec::new();

    loop {
        if is_prime_number(number, &primes) {
            println!("8: {}", number);
            if count == n {
                return number;
            } else {
                primes.push(number);
                number += 1;
                count += 1;
            }
        } else {
            number += 1
        }
    }
}

fn is_prime_number(number: u32, primes: &Vec<u32>) -> bool {
    for x in primes {
        if number % x == 0 {
            return false;
        }
    }
    true
}
