import Foundation

final class DoublyLinkedListNode {
    var data: Int
    var next: DoublyLinkedListNode?
    weak var prev: DoublyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class DoublyLinkedList {
    var head: DoublyLinkedListNode?
    var tail: DoublyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: DoublyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: DoublyLinkedListNode) {
        if let tail = tail {
            tail.next = node
            node.prev = tail
        } else {
            head = node
        }

        tail = node
    }
}

func printDoublyLinkedList(head: DoublyLinkedListNode?, sep: String, fileHandle: FileHandle) {
    var node = head

    while node != nil {
        fileHandle.write(String(node!.data).data(using: .utf8)!)

        node = node!.next

        if node != nil {
            fileHandle.write(sep.data(using: .utf8)!)
        }
    }
}

/*
 * Complete the 'sortedInsert' function below.
 *
 * The function is expected to return an INTEGER_DOUBLY_LINKED_LIST.
 * The function accepts following parameters:
 *  1. INTEGER_DOUBLY_LINKED_LIST llist
 *  2. INTEGER data
 */

/*
 * For your reference:
 *
 * DoublyLinkedListNode {
 *     data: Int
 *     next: DoublyLinkedListNode?
 *     prev: DoublyLinkedListNode?
 * }
 *
 */

func sortedInsert(llist: DoublyLinkedListNode?, data: Int) -> DoublyLinkedListNode? {
    let newNode = DoublyLinkedListNode(nodeData: data)
    guard llist != nil else { return newNode }
    guard llist!.data < newNode.data else {
        newNode.next = llist
        llist?.prev = newNode
        return newNode
    }
    var node = llist
    while let nextNode = node?.next, nextNode.data <= newNode.data {
        node = nextNode
    }
    let next = node?.next
    newNode.next = next
    newNode.prev = node
    newNode.next?.prev = newNode
    newNode.prev?.next = newNode
    return llist
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
