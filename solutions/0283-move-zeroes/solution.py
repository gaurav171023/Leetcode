class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        result=[x for x in nums if x!=0 ]
        move=result+[0]*(len(nums)-len(result))
        nums[:]=move
