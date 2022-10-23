/*
 Document Distance
 
 e.g.
 D1 = "the cat"
 D2 = "the dog"

 */

func documentDistance(_ d1: String, _ d2: String) -> Double {
    // Split doc into words
    let wordListForD1 = d1.split(separator: " ").compactMap { String($0) }
    let wordListForD2 = d2.split(separator: " ").compactMap { String($0) }

    // Compute word frequencies
    let freqForD1 = countFrequency(wordListForD1)
    let freqForD2 = countFrequency(wordListForD2)

    // Compute dot product
    return vectorAngle(freqForD1, freqForD2)
}

func countFrequency(_ list: [String]) -> [String: Int] {
    var map: [String: Int] = [:]

    for word in list {
        map[word, default: 0] += 1
    }

    return map
}

func vectorAngle(_ map1: [String: Int], _ map2: [String: Int]) -> Double {
    let numerator = innerProduct(map1, map2)
    let denominator = sqrt(innerProduct(map1, map1) * innerProduct(map2, map2))
    return Double(acosf(Float(numerator/denominator)))
}

func innerProduct(_ map1: [String: Int], _ map2: [String: Int]) -> Double {
    var sum = 0
    for item in map1 {
        if map2.keys.contains(item.key) {
            sum += (map1[item.key]! * map2[item.key]!)
        }
    }

    return Double(sum)
}

let D1 = "the cat"
let D2 = "the dog"

print(documentDistance(D1, D2))

/*
 What is Algorithm?
 Input -> algo -> output

 Program <-> Algorithm
 - Programming language <-> pseudocode/structured English
 - Computer <-> models of computation

 Models of Computation
 What operations an algorithm is allowed, and Cost of each step

 - RAM(Random Access Machine)
     - Random Access Memory (In computer, RAM is a huge array)
         - Load O(1) words
         - Do O(1) computations
         - Store O(1) words
         - O(1) registers
     - Words:
         - w bits, also known as input

 - Pointer Machine
     - Dynamically allocated objects
     - Objects has O(1) fields(e.g. Val)
     - Field = word (e.g. Int)
     - Pointer to object or null
     - Also known as reference

 - Python Machine
     - Has RAM and Pointer Machine
     - ‘List’ = array
     - List[i] = List[j] + 5, O(1) time
     - X = X.next, O(1) time
     - append(x), table doubling, O(1) time
     - L = l1 + l2,  O(l1.count + l2.count)
     - L.sort(), O(n logn)
     - HashTable, Dict[key] = val, O(1)
     - Long
     - Heap

 */
