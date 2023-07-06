impl Solution {
    pub fn is_palindrome(x: i32) -> bool {
        if x < 0 { return false }
        let mut num = x;
        let mut x_p = 0;

        while num > 0 {
            x_p = x_p * 10 + num % 10;
            num /= 10;
        }

        x == x_p
    }
}
