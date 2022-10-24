/*
 Heap(Priority Queue), ordered binary tree
 Implements a set of elements, each elements associated with a key

 Operations:
 - insert(s, x): Insert element x into set s
 - max(s): Return element of s with largest key
 - extract_max(s): Remove it from s
 - increaseKey(s, x, k): Increase the x’s key to new value k

 Example:
 [16, 14, 10, 8, 7, 9, 3, 2, 4, 1]
 visualized as a nearly completed binary tree, the height is bounded by logN

 Root of tree: 1st element ( i == 1 )
 Parent(i) = i/2
 leftChild(i) = 2i
 rightChild(i) = 2i + 1

 maxHeap: parent > child
 minHeap : parent < child
                    
 buildMaxHeap: creates a max heap from an unordered tree
 heapify: correct single violation of the heap property in a subtree (faster)

 Sorting Steps:
 1. Find max element from A, O(n)
 2. Swap elements A[n] with A(1)
 */

/*
 input: [1, 8, 5, 3, 2]
 then [8, 1, 5, 3, 2]
 then [8, 3, 5, 1, 2]

 complexity: O(logn)
 */
func heapify(_ input: inout [Int], startIndex: Int, endIndex: Int) {
    for i in startIndex...endIndex {
        let parent = i + 1
        var left = 2*parent
        var right = 2*parent + 1

        let parentIndex = parent - 1
        let leftIndex = left - 1
        let rightIndex = right - 1
        var maxAtIndex: Int = 0
        
        guard leftIndex <= endIndex, rightIndex <= endIndex  else {
            continue
        }

        if input.indices.contains(leftIndex),
           input[leftIndex] > input[parentIndex] { // left child > parent
            maxAtIndex = leftIndex
        }

        if input.indices.contains(rightIndex),
           input[rightIndex] > input[parentIndex],
           input[rightIndex] > input[maxAtIndex] { // right child > parent
            maxAtIndex = rightIndex
        }

        if input[parentIndex] != input[maxAtIndex] {
            input.swapAt(parentIndex, maxAtIndex)
        }
    }
}

var testHeapify = [2, 3, 5, 1, 8, 9]
heapify(&testHeapify, startIndex: 0, endIndex: 3)
print("Heapify: \(testHeapify)")

/*
 input: [2, 8, 5, 3, 9, 1]
 output: [9, 8, 5, 3, 2, 1]

 complexity: O(n)
 */
func buildMaxHeap(_ input: inout [Int]) {
    for i in 0..<input.count {
        let parent = (i + 1)/2
        heapify(&input, startIndex: parent, endIndex: input.count)
    }
}

var testBuildingMaxHeap = [2, 8, 5, 3, 9, 1]
buildMaxHeap(&testBuildingMaxHeap)
print("maxHeap: \(testBuildingMaxHeap)")

/*
 input: [2, 8, 5, 3, 9, 1]
 buildMaxHeap
 swap max with min, e.g. 9 <-> 1
 remove 9 from tree, then [1, 8, 5, 3, 2]
 heapify, then [8, 3, 5, 1, 2]
 repeat swaping max with min, and remove largest
 ....
 ouput: [1, 2, 3, 5, 8, 9]

 complexity: O(n logn)
 */
func heapSort(_ input: inout [Int]){
    buildMaxHeap(&input)

    for i in 1...(input.count - 1) {
        input.swapAt(0, input.count - i)
        heapify(&input, startIndex: 0, endIndex: input.count - i - 1)
    }
}

var testHeapSort = [2, 8, 5, 3, 9, 1]
heapSort(&testHeapSort)
print("sorted: \(testHeapSort)")
