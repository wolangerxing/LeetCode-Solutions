//
//  AddTwoNumbers.swift
//  LeetCodeSolutions
//
//  Created by bjyangwei on 17/2/24.
//  Copyright © 2017年 bjyangwei. All rights reserved.
//

/**
 https://leetcode.com/problems/add-two-numbers/
 
 #2 Add Two Numbers
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */

/**
 思路：遍历一遍，处理好进位
 */

class addTwoNumbersSolution {
    class ListNode{
        var val : Int
        var next : ListNode?
        init(_ val : Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var tmp1 = l1
        var tmp2 = l2
        let finalList : ListNode = ListNode(0)
        var head = finalList
        var sum = 0
        
        while tmp1 != nil || tmp2 != nil {
            sum /= 10
            if let node = tmp1 {
                sum += node.val
                tmp1 = node.next
            }
            if let node = tmp2 {
                sum += node.val
                tmp2 = node.next
            }
            head.next = ListNode(sum % 10)
            if let node = head.next {
                head = node
            }
        }
        if sum / 10 == 1 {
            head.next = ListNode(1)
        }
        return finalList.next
    }
}
