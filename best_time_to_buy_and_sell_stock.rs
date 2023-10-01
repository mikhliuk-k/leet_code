impl Solution {
    pub fn max_profit(prices: Vec<i32>) -> i32 {
        let min_num: i16;
        let max_num: i16;

        for num in prices {
            if !min_num || num < min_num {
                min_num = num;
            }

            if min_num && (!max_num || num > max_num) {
                max_num = num;
            }
        }

        if min_num && max_num {
            max_num - min_num
        } else {
            0
        }
    }
}
