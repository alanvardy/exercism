pub fn is_armstrong_number(num: u32) -> bool {
    let digits: Vec<u32> = num.to_string().chars().map(|d| to_digit(d)).collect();
    let num_digits = digits.iter().count();
    let sum = digits.iter().fold(0, |acc, x| acc + x.pow(num_digits as u32));
    println!("5: {}", sum);
    sum == num
}

fn to_digit(character: char) -> u32 {
    character.to_digit(10).unwrap()
}
