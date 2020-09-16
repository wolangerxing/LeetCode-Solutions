#
# @lc app=leetcode id=2 lang=python
#
# [2] Add Two Numbers
#

# @lc code=start
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        if l1 == None:
            return l2
        if l2 == None:
            return l1
        head1 = l1
        head2 = l2
        ret = ListNode()
        head = ret
        toSum = 0

        while (head1 != None and head2 != None):
            cur = ListNode((head1.val+head2.val+toSum)%10, None)
            head.next = cur
            head = cur
            toSum = (head1.val+head2.val+toSum)/10
            head1 = head1.next
            head2 = head2.next

        while (head1 != None):
            cur = ListNode((head1.val+toSum)%10, None)
            head.next = cur
            head = cur
            toSum = (head1.val+toSum)/10
            head1 = head1.next

        while (head2 != None):
            cur = ListNode((head2.val+toSum)%10, None)
            head.next = cur
            head = cur
            toSum = (head2.val+toSum)/10
            head2 = head2.next

        if toSum != 0:
            head.next = ListNode(toSum, None)

        return ret.next
        
# @lc code=end

