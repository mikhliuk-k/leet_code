# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums_h = nums.each_with_index.to_h

  nums.each_with_index do |num1, idx1|
    num2 = target - num1
    idx2 = nums_h[num2]
    return [idx1, idx2] if idx2 && idx1 != idx2
  end

  [nil, nil]
end
