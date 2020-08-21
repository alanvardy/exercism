pub fn verse(n: u32) -> String {
    let prefix = match n {
        0 => String::from("No more bottles"),
        1 => String::from("One bottle"),
        _ => format!("{} bottles", n),
    };

    match n {
        0 => String::from("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"),
        1 => String::from("1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"),
        _ => format!("{} of beer on the wall, {} of beer.\nTake one down and pass it around, {} of beer on the wall.\n", prefix, bottles(&n), bottles(&(&n - 1))),
    }
}

pub fn sing(start: u32, end: u32) -> String {
    let mut song = verse(start);
    let mut num = start;
    loop {
        num -= 1;
        song.push_str("\n");
        song.push_str(&verse(num));
        if num == end {
            break;
        }
    }
    song
}

fn bottles(n: &u32) -> String {
    return match n {
        0 => String::from("No more bottles"),
        1 => String::from("1 bottle"),
        _ => format!("{} bottles", n),
    };
}
