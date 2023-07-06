impl Solution {
    pub fn fizz_buzz(n: i32) -> Vec<String> {
        let mut out = Vec::new();

        for number in 1..(n + 1) {
            if number % 3 == 0 && number % 5 == 0 {
                out.push("FizzBuzz".to_string());
            } else if number % 3 == 0 {
                out.push("Fizz".to_string());
            } else if number % 5 == 0 {
                out.push("Buzz".to_string());
            } else {
                out.push(number.to_string());
            }
        }

        out
    }
}
