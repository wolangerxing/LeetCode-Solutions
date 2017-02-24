//
//  Two Sum .swift
//  LeetCodeSolutions
//
//  Created by bjyangwei on 17/2/24.
//  Copyright © 2017年 bjyangwei. All rights reserved.
//

/**
 https://oj.leetcode.com/problems/two-sum/
 
 #1 Two Sum
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

/**
 思路：遍历一遍，利用hashMap
 */

class twoSumSolution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int]  {
        var hashMap : [Int: Int] = [Int: Int]()
        var result = [Int]()
        for i in 0..<nums.count {
            let numberToBeFind = target - nums[i]
            if let numberIndexToBeFind = hashMap[numberToBeFind] {
                result.append(numberIndexToBeFind)
                result.append(i)
                return result
            } else {
                hashMap[nums[i]] = i
            }
        }
        return result
    }
}
