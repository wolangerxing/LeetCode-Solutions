#
# @lc app=leetcode id=3 lang=python
#
# [3] Longest Substring Without Repeating Characters
#

# @lc code=start
class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        if len(s) <= 1:
            return len(s)
        dic = {}
        
        start = 0
        dic[s[start]] = start

        end = 1

        maxLength = 1
        while end != len(s):
            if s[end] in dic and dic[s[end]] >= start:
                curStart = dic[s[end]]+1
                for i in range(start, curStart):
                    if s[i] in dic and dic[s[i]] < curStart:
                        del dic[s[i]]
                start = curStart
                dic[s[end]] = end
            else:
                dic[s[end]] = end
                if end-start+1 > maxLength:
                    maxLength = end-start+1
                    print("start %d end %d", start, end)
            end += 1
        return maxLength
# @lc code=end

