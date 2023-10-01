impl Solution {
    pub fn longest_palindrome(s: String) -> String {
        if s.len() == 1 { return s; }

        let mut max_pol: (usize, usize, usize) = (0, 0, 0);
        let mut pol: (usize, usize, usize);

        for idx in 0..(s.len() - 1) {
            let ch1 = &s[idx..idx + 1];
            let ch2 = &s[idx + 1..idx + 2];

            if ch1 == ch2 {
                pol = Solution::get_palindrome(&s, idx, idx + 1);
                if pol.2 > max_pol.2 { max_pol = pol }
            }

            pol = Solution::get_palindrome(&s, idx, idx);
            if pol.2 > max_pol.2 { max_pol = pol }
        }

        return s[max_pol.0..max_pol.1 + 1].to_string();
    }

    fn get_palindrome(str: &str, idx1: usize, idx2: usize) -> (usize, usize, usize) {
        if idx1 == 0 || idx2 + 1 >= str.len() || str[idx1 - 1..idx1] != str[idx2 + 1..idx2 + 2] {
            return (idx1, idx2, str[idx1..idx2 + 1].len());
        }

        Solution::get_palindrome(str, idx1 - 1, idx2 + 1)
    }
}
