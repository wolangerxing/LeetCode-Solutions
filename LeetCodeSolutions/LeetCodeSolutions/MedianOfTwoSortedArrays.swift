//
//  MedianOfTwoSortedArrays.swift
//  LeetCodeSolutions
//
//  Created by bjyangwei on 17/2/24.
//  Copyright © 2017年 bjyangwei. All rights reserved.
//

/**
 https://leetcode.com/problems/median-of-two-sorted-arrays/

 #3 Median of Two Sorted Arrays
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */

/**
 思路：转化为查找两个排序数组的第k个元素
 */

class MedianOfTwoSortedArraysSolution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n = nums1.count
        let m = nums2.count
        if (n + m) % 2 == 0 {
            return (findKthElement(nums1, nums2, (n + m) / 2 - 1) + findKthElement(nums1, nums2, (n + m) / 2)) / 2
        } else {
            return findKthElement(nums1, nums2, (n + m) / 2)
        }
    }
    func findKthElement(_ nums1: [Int], _ nums2: [Int], _ k:Int) -> Double {
        let count1 = nums1.count
        let count2 = nums2.count
        
        if count1 <= 0 && count2 <= 0 {
            return 0.0
        }
        if count1 <= 0 {
            return Double(nums2[0])
        }
        if count2 <= 0 {
            return Double(nums1[0])
        }
        if k == 0 {
            return Double(min(nums1[0], nums2[0]))
        }
        let mid1 = count1 / 2
        let mid2 = count2 / 2
        if nums1[mid1] > nums2[mid2] {
            if mid1 + mid2 - 1 > k {
                return findKthElement(Array(nums1[0..<mid1]), nums2, k)
            } else {
                return findKthElement(nums1, Array(nums2[mid2..<count2]), k - mid2)
            }
        } else {
            if mid1 + mid2 - 1 > k {
                return findKthElement(nums1, Array(nums2[0..<mid2]), k)
            } else {
                return findKthElement(Array(nums1[mid1..<count1]), nums2, k - mid1)
            }
        }
    }
}
