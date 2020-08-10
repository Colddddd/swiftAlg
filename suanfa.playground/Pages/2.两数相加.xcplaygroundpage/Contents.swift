

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let dummy = ListNode(0)
    var carry: Int = 0
    var q: ListNode? = l1
    var p: ListNode? = l2
    var curr: ListNode = dummy
    
    while q != nil || p != nil {
        
        let x: Int = q?.val ?? 0
        let y: Int = p?.val ?? 0
        
        let sum = x + y + carry
        
        curr.next = ListNode(sum % 10)
        curr = curr.next!
        
        q = q?.next ?? nil
        p = p?.next ?? nil
        
        carry = sum / 10
    }
    
    if carry > 0 {
        curr.next = ListNode(carry)
    }
    
    return dummy.next
}
