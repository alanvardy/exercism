pub fn build_proverb(list: &[&str]) -> String {
   let mut iterator: usize = 0;
   let mut saying = String::new();

   while iterator + 1 < list.len() {
      saying.push_str(&generate_line(&list, iterator));
      iterator += 1;
   }

   if list.len() > 0 {
      saying.push_str(&final_line(&list));
   }
   saying
}

fn generate_line(list: &[&str], iterator: usize) -> String {
   let result = format!(
      "For want of a {} the {} was lost.\n",
      list[iterator],
      list[iterator + 1]
   );
   result
}

fn final_line(list: &[&str]) -> String {
   let result = format!("And all for the want of a {}.", list[0]);
   result
}
