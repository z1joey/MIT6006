/*
 Insertion Sort
 For example:
 5, 2, 4, 6, 1, 3

 - Start from index 1 (key), because index 0 is considered as already sorted
     - 2, 5, 4, 6, 1, 3
 - Now the key becomes index 2, value is 5, swap
     - 2, 4, 5, 6, 1, 3
 - Now the key becomes index 3, value is 6, do nothing
     - 2, 4, 5, 6, 1, 3
 - Now the key becomes index 4, value is 1, swap until 1 is at the correct position
     - 1, 2, 4, 5, 6, 3
 - Now value is 3, swap until 3 is at the correct position
     - 1, 2, 3, 4, 5, 6

 Considering pointer movement, steps are n - 1, because start from index 1
 Each step compare with previous values O(n squared)
 Can do binary search from sorted part O(n logn), but there is an issue that we need to find the index before target
 */

// Complexity: O(squared n)
func insertionSort(_ nums: inout [Int]) {
    var ptr = 1
    
    while ptr < nums.count {
        var right = ptr
        var left = right - 1

        while left >= 0, nums[left] > nums[right] {
            nums.swapAt(left, right)
            
            left -= 1
            right -= 1
        }
        
        ptr += 1
    }
}

var nums = [5, 2, 4, 6, 1, 3]
insertionSort(&nums)

print(nums)

/*
 Merge Sort
 Dived & Conquer

 - An array of size n
 - Divided into 2 arrays of size n/2 - logN
 - Get 2 sorted arrays of size n/2
 - Merge, get 2 sorted array of size n * N/2

 For example:
 let sortedArr1 = [20, 13, 7, 2]
 let sortedArr2 = [12, 11, 9, 1]

 - Compare last elements from 2 arrays which are 1 and 2
     - Res: [1]
 - Now pointers pointed to 2 and 9
     - Res: [1, 2]
 - Repeat steps
 - O(n logn)
 */

// Complexity: O(n logn)
func mergeSort(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }

    let mid = nums.count / 2
    let left = mergeSort(Array(nums[0..<mid]))
    let right = mergeSort(Array(nums[mid..<nums.count]))

    return mergeSort(left, right)
}

func mergeSort(_ left: [Int], _ right: [Int]) -> [Int] {
    var l = 0
    var r = 0

    var sorted: [Int] = []

    while l < left.count && r < right.count {
        if left[l] > right[r] {
            sorted.append(right[r])
            r += 1
        } else if left[l] < right[r] {
            sorted.append(left[l])
            l += 1
        } else {
            sorted.append(left[l])
            sorted.append(right[r])
            l += 1
            r += 1
        }
    }

    while l < left.count {
        sorted.append(left[l])
        l += 1
    }

    while r < right.count {
        sorted.append(right[r])
        r += 1
    }

    return sorted
}

print(mergeSort([1, 3, 5], [2, 4, 6, 7]))
print(mergeSort([5, 2, 1, 3, 4]))
