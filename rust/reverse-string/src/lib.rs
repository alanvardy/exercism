use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    let graphemes = UnicodeSegmentation::graphemes(input, true).collect::<Vec<&str>>();
    let mut result = String::new();

    for item in graphemes.iter().rev() {
        result.push_str(item);
    }

    result
}
