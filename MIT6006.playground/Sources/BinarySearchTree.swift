/*
 Binary Search Tree

 Runway reservation system
 Airport with a single runway, reservation for future landings

 - Reserve request specifies landing time
 - Add t to the set R if no other landings are scheduled within k minutes
 - Remove from set R after plane lands

 Rank(t): how many planes are scheduled before t?
 1. Walk down tree to find desired time
 2. Add in the node that are smaller
 3. Add in the subtree size to the left

 Example 1:

 Set = [37, 41.2, 49, 56.6]
 Now = 37
 Target = 53
 K = 3

 53 OK
 44 Not allowed, too close to 41.2
 20 Not allowed, which is past

 Example 2:
 In case of an unsorted array

 Insert item
 - without check, O(1)
 - check, O(n)

 In case of a sorted array
 [4, 20, 32, 37, 45], 34

 Binary search:
 Find smallest i, where R[i] >= t
 Compare R[i] and R[i -1] against t in O(n) time
 Actual insertion (shifting) -> O(n)

 Binary Search Tree(BST)
 A tree has pointers, unlink a heap.
 A BST is a tree where right child > parent > left child

 Operations:
 findMin(): keep going left O(h) complexity, h: height of tree
 findMax(): keep going right

 */

class Node<T> {
  var value: T
  var leftChild: Node?
  var rightChild: Node?

  init(value: T) {
    self.value = value
  }
}

indirect enum BinaryTree<T: Comparable> {
    case empty
    case node(BinaryTree, T, BinaryTree)

    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }

    mutating func naiveInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }

        if newValue < value {
          left.naiveInsert(newValue: newValue) // left = newValue
        } else {
          right.naiveInsert(newValue: newValue) // right = newValue
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

print(tree.count)
