class Solution {
public:
    int jump(vector<int> &nums) {
        int jumps_count = 0;
        int far_idx = 0;
        int far_idx_tmp = 0;

        for (int idx = 0; idx < nums.size() - 1; idx++) {
            far_idx_tmp = max(far_idx_tmp, idx + nums[idx]);

            if (idx == far_idx) {
                jumps_count++;
                far_idx = far_idx_tmp;
            }
        }

        return jumps_count;
    }
};
