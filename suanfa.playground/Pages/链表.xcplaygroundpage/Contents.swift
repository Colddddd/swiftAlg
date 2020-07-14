import UIKit


extension List: CustomStringConvertible {
  // 2
  public var description: String {
    // 3
    var text = "["
    var node = head
    // 4
    while node != nil {
      text += "\(node!.val)"
      node = node!.next
      if node != nil { text += " -> " }
    }
    // 5
    return text + "]"
  }
}



// 节点  数据  +  下一个指针
class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


// 链表
class List {
    var head: ListNode?
    var tail: ListNode?

    // 头插法 ，插入到第一个
    func insertToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }

    // 尾插法, 插入到最后一个
    func insertToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
}

var list = List()

let array = [1,5,3,2,4,2]
array.forEach {list.insertToTail($0)}

print(list)


func getResult(_ head: ListNode?, _ x: Int) -> ListNode? {
    let dummy = ListNode(0)
    var pre = dummy
    
    let rightDummy = ListNode(0)
    var last = rightDummy
    
    var node = head
    
    while node != nil {
        if node!.val < x {
            pre.next = node
            pre = node!
        } else {
            last.next = node
            last = node!
        }
        node = node!.next
    }
    
    //MARK: 这里的pre.next 需要指向 右边 虚拟的next
    pre.next = rightDummy.next
    
    // 防止链表循环指向构成环
    last.next = nil
    
    return pre.next
}

getResult(list.head, 3)
print("ddd \(list) ")

// Dummy node 是一个虚拟节点


// 快慢指针判断有没有环
func hasCycle(_ head: ListNode?) -> Bool {
    var fast = head
    var slow = head
    
    while fast != nil && fast!.next != nil{
        slow = slow?.next
        fast = fast!.next!.next
        if slow === fast {
            return true
        }
    }
    return false
}

print(hasCycle(list.head))





var list1 = List()

let array1 = [1,2,3,4,5]
array1.forEach {list1.insertToTail($0)}
print(list1)


// 删除倒数第几个
func removeFromRight(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    let dummy = ListNode(0)
    dummy.next = head
    var pre: ListNode? = dummy
    var last: ListNode? = dummy
    
    // 先跑2米
    for _ in 0 ..< n {
       last = last!.next
    }
    
    while last != nil && last!.next != nil {
        pre = pre!.next
        last = last!.next
    }
    
    pre!.next = pre!.next!.next
    
    return dummy.next
}




//removeFrom(list1.head,2)
//print(list1)
//

// 删除正数
func removeFromLeft(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    let dummy = ListNode(0)
    dummy.next = head
    var pre: ListNode? = dummy
    
    for _ in 0 ..< n - 1  {
        if pre == nil {
            break
        }
        pre = pre!.next
    }
    
    pre!.next = pre!.next!.next

    return dummy.next
}

removeFromLeft(list1.head, 2)
print(list1)
