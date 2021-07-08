import Foundation
/// 4. 寻找两个正序数组的中位数
/// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/
public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums2.count + nums1.count == 0 {
        return 0.0
    }
    if nums2.count + nums1.count == 1 {
        return Double.init(nums1.count > 0 ? nums1[0] : nums2[0])
    }
    var i = 0
    var j = 0
    var k = 0
    var nums = Array.init(repeating: 0, count: nums1.count + nums2.count)
    while(i < nums1.count && j < nums2.count){
        if(nums1[i] <= nums2[j]) {
            nums[k] = nums1[i];
            i += 1
        }
        else {
            nums[k] = nums2[j];
            j += 1
        }
        k += 1
    }
    while(j < nums2.count){
        nums[k] = nums2[j];
        k += 1
        j += 1
    }
    while(i < nums1.count){
        nums[k] = nums1[i];
        k += 1
        i += 1
    }
    return Double.init(nums[(nums.count + 1) / 2 - 1] + nums[(nums.count + 2) / 2 - 1]) * 0.5
}

public func testFindMedianSortedArrays() {
    let nums1 = [4, 5]
    let nums2 = [3, 4]
    print("中位值:\(findMedianSortedArrays(nums1, nums2))")
}
