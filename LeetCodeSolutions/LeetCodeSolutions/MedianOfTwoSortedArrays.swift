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
            return (findKthElement(nums1, 0, n - 1, nums2, 0, m - 1, (n + m) / 2 - 1) + findKthElement(nums1, 0, n - 1, nums2, 0, m - 1, (n + m) / 2)) / 2
        } else {
            return findKthElement(nums1, 0, n - 1, nums2, 0, m - 1, (n + m) / 2)
        }
    }
    func findKthElement(_ num1:[Int], _ start1:Int, _ end1:Int, _ num2:[Int], _ start2:Int, _ end2:Int, _ k:Int) -> Double {
        if end1 < start1 && end2 < start2 {
            return 0.0
        }
        if end1 < start1 {
            return Double(num2[k])
        }
        if end2 < start2 {
            return Double(num1[k])
        }
        
        if start1 == end1 && start2 == end2 {
            return Double(min(num1[start1], num2[start2]))
        }
        
        let mid1 = (end1 + start1) / 2
        let mid2 = (end2 + start2) / 2
        
        let arrayTest : Array
        
        
        if num1[mid1] > num2[mid2] {
            if mid1 + mid2 >= k {
                return findKthElement(num1, start1, mid1 - 1, num2, start2, end2, k)
            } else {
                return findKthElement(num1, start1, end1, num2, mid2 + 1, end2, k)
            }
        } else {
            if mid1 + mid2 >= k {
                return findKthElement(num1, start1, end1, num2, start2, mid2 - 1, k)
            } else {
                return findKthElement(num1, mid1 + 1, end1, num2, start2, end2, k)
            }
        }
    }
}
