import UIKit


class Node {
    var data: Int
    var left : Node?
    var right: Node?
    init(data: Int) {
        self.data = data
    }
    

}

func preOrderTraversal(node: Node?) {
    guard let node = node else { return }
    print(node.data)
    preOrderTraversal(node: node.left)
    preOrderTraversal(node: node.right)
}
func inOrderTraversal(node: Node?) {
    guard let node = node else { return }
    inOrderTraversal(node: node.left)
    print(node.data)
    inOrderTraversal(node: node.right)
}
func postOrderTraversal(node: Node?) {
    guard let node = node else { return }
    postOrderTraversal(node: node.left)
    postOrderTraversal(node: node.right)
    print(node.data)
}

var root = Node(data: 20)
root.left = Node(data: 10)
root.left?.left = Node(data: 5)
root.left?.right = Node(data: 15)
root.right = Node(data: 30)
root.right?.left = Node(data: 25)
root.right?.right = Node(data: 27)
//preOrderTraversal(node: root)

//inOrderTraversal(node: root)

//postOrderTraversal(node: root)

func isFullBinaryTree(node: Node?) -> Bool{
    guard let node = node else {
        return true
    }
    
    //Check children
    if node.left == nil && node.right == nil {
        return true
    }
    if let leftNode = node.left, let rightNode = node.right {
        return isFullBinaryTree(node: leftNode) && isFullBinaryTree(node: rightNode)
    }
    return false
}

func getDepth(node: Node?) -> Int {
    var depth = 0
    var node = node
    while node != nil {
        depth += 1
        node = node?.left
    }
    return depth
}

func isPerfect(root: Node?, d:Int, level :Int = 0) -> Bool{
    
    if root == nil {
        return true
    }
    if root?.left == nil && root?.right == nil {
        return d == level + 1
    }
    
    if root?.left == nil ||  root?.right == nil {
        return false
    }
    
    return isPerfect(root: root?.left, d: d, level: level + 1) && isPerfect(root: root?.right, d: d, level: level + 1)
}

func isPerfect(root: Node) ->Bool {
    let depth = getDepth(node: root)
    return isPerfect(root: root, d: depth)
}

if isPerfect(root: root) {
    print("Perfect BST")
} else {
    print("Not pefect BST")
}





