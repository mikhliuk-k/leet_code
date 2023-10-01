impl Solution {
    pub fn trap(height: Vec<i32>) -> i32 {
        if height.len() == 0 { return 0 }

        let mut water_amount = 0;
        let mut left_index = 0;
        let mut right_index = height.len() - 1;
        let mut left_height = height[0];
        let mut right_height = height[height.len() - 1];
        let mut left_height_max = 0;
        let mut right_height_max = 0;

        while left_index < right_index {
            if left_height < right_height {
                if left_height_max < left_height {
                    left_height_max = left_height;
                } else {
                    water_amount += left_height_max - left_height;
                }
                left_index += 1;
                left_height = height[left_index];
            } else {
                if right_height_max < right_height {
                    right_height_max = right_height;
                } else {
                    water_amount += right_height_max - right_height;
                }
                right_index -= 1;
                right_height = height[right_index];
            }
        }

        return water_amount;
    }
}
