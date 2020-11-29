import UIKit
import XCTest

/*
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 Follow up:
 Could you do get and put in O(1) time complexity?
 
 Example 1:

 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4
  

 Constraints:

 1 <= capacity <= 3000
 0 <= key <= 3000
 0 <= value <= 104
 At most 3 * 104 calls will be made to get and put.
 */

class DLLNode {
    var key: Int
    var value: Int
    var prev: DLLNode?
    var next: DLLNode?
    
    init(key: Int, val: Int) {
        self.key = key
        self.value = val
    }
}

class DoublyLL {
    
    var head: DLLNode?
    var tail: DLLNode?
    
    @discardableResult func addItemToTheFrontOfTheList(_ key: Int, val: Int) -> DLLNode {
        let newNode = getNewNode(key, val: val)
        addNodeToFrontOfList(newNode)
        return newNode
    }
    
    func addNodeToFrontOfList(_ node: DLLNode) {
        if head == nil {
            head = node
            tail = node
            node.next = nil
            node.prev = nil
            return
        }
        tail?.next = node
        node.prev = tail
        node.next = nil
        tail = node
    }
    
    private func getNewNode(_ key: Int, val: Int) -> DLLNode {
        return DLLNode(key: key, val: val)
    }
    
    func removeNodeFromList(_ node: DLLNode) {
        if node.prev == nil, node.next == nil {
            head = nil
            tail = nil
            return
        }
        
        if node.prev == nil { // removing head
            head = node.next
            node.next?.prev = nil
            node.next = nil
            return
        }
        
        if node.next == nil { // removing tail
            tail = node.prev
            node.prev?.next = nil
            node.prev = nil
            return
        }
        
        // mid case
        let prevNode = node.prev
        prevNode?.next = node.next
        node.next?.prev = prevNode
        node.next = nil
        node.prev = nil
    }
    
    func printDLL() {
        var temp = head
        while temp != nil {
            print("\(temp!.value) <->")
            temp = temp?.next
        }
    }
    
    func getOrderedValues() -> [Int] {
        var values: [Int] = []
        var temp = head
        while temp != nil {
            values.append(temp!.value)
            temp = temp?.next
        }
        return values
    }
}

class LRUCache {
    
    private let capacity: Int
    private var itemHashMap: [Int: DLLNode] = [:]
    private lazy var doublyLL: DoublyLL = DoublyLL()
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let keyNode = itemHashMap[key] else {
            return -1
        }
        doublyLL.removeNodeFromList(keyNode)
        doublyLL.addNodeToFrontOfList(keyNode)
        doublyLL.printDLL()
        return keyNode.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity != 0 else { return }
        
        if let keyNode = itemHashMap[key] {
            doublyLL.removeNodeFromList(keyNode)
            keyNode.value = value
            doublyLL.addNodeToFrontOfList(keyNode)
            doublyLL.printDLL()
        } else {
            if !thereIsAnyVacancy() {
                if let lruNode = doublyLL.head {
                    doublyLL.removeNodeFromList(lruNode)
                    removeNodeRefFromHashMap(lruNode.key)
                }
            }
            let addedNode = doublyLL.addItemToTheFrontOfTheList(key, val: value)
            storeNodeRefToHashMap(key, node: addedNode)
            doublyLL.printDLL()
        }
    }
    
    private func removeNodeRefFromHashMap(_ key: Int) {
        itemHashMap.removeValue(forKey: key)
    }
    
    private func storeNodeRefToHashMap(_ key: Int, node: DLLNode) {
        itemHashMap[key] = node
    }
    
    private func thereIsAnyVacancy() -> Bool {
        return itemHashMap.keys.count < capacity
    }
    
    @discardableResult func getList() -> [Int] {
        return doublyLL.getOrderedValues()
    }
}

//let obj = LRUCache(capacity)
//let ret_1: Int = obj.get(key)
//obj.put(key, value)

class LRUCacheTest: XCTestCase {
    // a1       a2        g1        a3      a4
    // (1) -> (1, 2) -> (2, 1) -> (1, 3) -> (4, 3)
    func test1() {
        let lruCache = LRUCache(2)
        lruCache.put(1, 1)
        XCTAssertEqual(lruCache.getList(), [1], "a")
        lruCache.put(2, 2)
        XCTAssertEqual(lruCache.getList(), [1, 2], "b")
        lruCache.get(1)
        XCTAssertEqual(lruCache.getList(), [2, 1], "c")
        lruCache.put(3, 3)
        XCTAssertEqual(lruCache.getList(), [1, 3], "d")
        lruCache.put(4, 4)
        XCTAssertEqual(lruCache.getList(), [3, 4], "e")
        lruCache.put(3, 6)
        XCTAssertEqual(lruCache.getList(), [4, 6], "e")
    }
    
    func test2() {
        let lruCache = LRUCache(0)
        lruCache.put(1, 1)
        XCTAssertEqual(lruCache.getList(), [], "a")
    }
    
    func test3() {
        let lruCache = LRUCache(1)
        lruCache.put(2, 1)
        XCTAssertEqual(lruCache.getList(), [1], "a")
        XCTAssertEqual(lruCache.get(2), 1, "b")
        XCTAssertEqual(lruCache.getList(), [1], "c")
        lruCache.put(3, 2)
        XCTAssertEqual(lruCache.getList(), [2], "d")
        XCTAssertEqual(lruCache.get(2), -1, "e")
    }
}

let lruTest = LRUCacheTest.defaultTestSuite
lruTest.run()

