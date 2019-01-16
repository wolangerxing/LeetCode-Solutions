//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCodeSolutions
//
//  Created by bjyangwei on 17/2/24.
//  Copyright © 2017年 bjyangwei. All rights reserved.
//

/**
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 
 #3 Longest Substring Without Repeating Characters
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/**
 思路：记录当前路径长度，最长路径长度，处理好当前路径的更新
 */

class LongestSubstringWithoutRepeatingCharactersSolution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLenght = 0
        var currentLenght = 0
        var hashMap = Dictionary<Character, Int>()
        var charactersArray = Array(s)
        for i in 0..<charactersArray.count{
            if let lastPosition = hashMap[charactersArray[i]] {
                if lastPosition < i - currentLenght {
                    currentLenght += 1
                } else {
                    currentLenght = i - lastPosition
                }
            } else {
                currentLenght += 1
            }
            hashMap[charactersArray[i]] = i
            if currentLenght > maxLenght {
                maxLenght = currentLenght
            }
        }
        return maxLenght
    }
}
