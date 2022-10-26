/*
 Counting & Radix Sorting
 
 Comparison Model:
 - All input items are black boxes
 - Only operations allowed are comparisons

 Decision Tree:
 - Any comparison algorithm can be viewed as a tree of all possible outcomes/answers
 - Tree height >= log n
 - Leaves >= possible answers(n!)

 e.g. Binary Search
 nums = [0, 1, 2], k = 3
 if nums[1] < k, no go left, yes go right, continue….

 Searching Lower Bound:
 - N preprocess items, such as build a AVL tree
 - Finding a given item among them

 Linear-time sorting (Integers)

 Counting Sort:
 e.g. [6, 3, 7, 5, 5, 1, 6, 5]
 Count: Three 5, Two 6 ..

 Radix Sort
 - Sort ones digits, then tens, then hundreds
 - Counting Sort
 */

// O(n * logn)
func countingSort(_ nums: [Int]) -> [Int] {
    var map: [Int: Int] = [:] // element : count

    // O(n)
    for n in nums {
        map[n, default: 0] += 1
    }
    
    var output: [[Int]] = []
    // O(n * logn)
    for item in map.sorted { $0.key < $1.key } {
        output.append([Int](repeating: item.key, count: item.value))
    }

    return output.flatMap { $0 }
}

print(countingSort([3, 2, 1, 1, 3, 5]))

/*
 origial: 170, 45, 75, 90, 802, 24, 2, 66
 
 sorting ones     : 170, 90, 802, 2, 24, 45, 75, 66
 sorting tens     : 802, 2, 24, 45, 66, 170, 75, 90
 sorting hundreds : 2, 24, 45, 66, 75, 90, 170, 802

 */
func radixSort(_ nums: [Int]) -> [Int] {
    let max = nums.max()! // O(n)

    // TODO: radix sorting
}
