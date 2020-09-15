#
# @lc app=leetcode id=1 lang=python
#
# [1] Two Sum
#

# @lc code=start
class Solution(object):
    def twoSum(self, nums, target):
        dic = {}
        for idx, num in enumerate(nums):
            if target - num in dic:
                return [dic[target - num], idx] 
            else:
                dic[num] = idx
        return [0,0]
        
# @lc code=end

