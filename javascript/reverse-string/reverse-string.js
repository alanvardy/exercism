export const reverseString = (string) => {
  let new_string = '';
  for (let index = string.length - 1; index >= 0; index -= 1) {
    new_string += string[index];
  }
  return new_string;
}