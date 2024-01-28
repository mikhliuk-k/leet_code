class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        if (nums.size() == k) return;
        k = k % nums.size();

        int rotated_count = 0;

        for (int starting_index = 0; rotated_count < nums.size(); starting_index += 1) {
            int index = starting_index;
            int next_var = nums[index];

            do {
                const int next_index = (index + k) % nums.size();
                const int tmp_var = nums[next_index];
                nums[next_index] = next_var;
                next_var = tmp_var;
                index = next_index;
                rotated_count += 1;
            } while (index != starting_index && rotated_count < nums.size());
        }
    }
};
