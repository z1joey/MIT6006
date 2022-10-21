/*

 Peak Finding (1D)

 Given an array of numbers

 Peak:
 if n is the last item, n >= n - 1
 else if and only if n >= n - 1, and n >= n + 1
 
 Leetcode:
 162

*/

// Divide & Conquer

// Complexity: O(logn)
func findPeak(_ nums: [Int]) -> Int {
    var mid = nums.count / 2

    if nums.indices.contains(mid - 1),
       nums[mid - 1] > nums[mid] {
        // then look at 0...(n/2 - 1)
        return findPeak(Array(nums[0...(mid - 1)]))
    } else if nums.indices.contains(mid + 1),
              nums[mid + 1] > nums[mid] {
        // then look at (n/2 + 1)...n
        return (mid + 1) + findPeak(Array(nums[(mid + 1)...(nums.count - 1)]))
    } else {
        // best case, n/2 is a peak
        return mid
    }
}

print(findPeak([1, 2, 3]))
print(findPeak([1, 3, 2]))

/*

 Peak Finding (2D)
  
 Given a (x, y) grid
 
 Peak:
 grid(x, y) > grid(x + 1, y)
 grid(x, y) > grid(x - 1, y)
 grid(x, y) > grid(x, y + 1)
 grid(x, y) > grid(x, y - 1)
 
 Leetcode:
 1901

*/

// lecture solution
// Complexity: O(mlogn)
func lecture_findPeak(_ grid: [[Int]]) -> Int {
    if grid.count == 1 {
        return grid[0].max()!
    }

    // pick a middle column
    let midY = grid.count / 2

    // find max value from the column
    let maxVal = grid[midY].max()!
    let maxValX = grid[midY].firstIndex(of: maxVal)!
    
    // compare left/right value
    // if left > max, pick left side
    // if right > max, pick right side
    if grid[midY - 1][maxValX] > maxVal {
        return lecture_findPeak(Array(grid[0...(midY - 1)]))
    } else if grid[midY + 1][maxValX] > maxVal {
        return lecture_findPeak(Array(grid[(midY + 1)...(grid.count - 1)]))
    } else {
        return maxVal
    }
}

// Complexity: O(mn)
func findPeak(_ grid: [[Int]]) -> Int {
    guard grid.count > 2 else {
        return 0
    }

    let second = 1
    let lastSecond = grid.count - 2
    
    if second == lastSecond {
        let maxVal = grid[second][1...(grid[second].count - 2)].max()!
        let maxValX = grid[second].firstIndex(of: maxVal)!

        if grid[second - 1][maxValX] < maxVal, grid[second + 1][maxValX] < maxVal {
            return maxVal
        }
    } else {
        for y in second...lastSecond {
            let maxVal = grid[y][1...(grid[y].count - 2)].max()!
            let maxValX = grid[y].firstIndex(of: maxVal)!

            if grid[y - 1][maxValX] < maxVal, grid[y + 1][maxValX] < maxVal {
                return maxVal
            }
        }
    }

    return 0
}

let input = [
    [1, 1, 1, 2],
    [1, 0, 8, 3],
    [1, 1, 1, 3]
]

print(findPeak(input))
print(lecture_findPeak(input))
