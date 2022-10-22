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
