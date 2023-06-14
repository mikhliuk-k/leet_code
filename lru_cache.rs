use std::collections::LinkedList;

struct LRUCache {
    map: HashMap<i32, i32>,
    list: LinkedList<i32>,
}


/**
 * `&self` means the method takes an immutable reference
 * If you need a mutable reference, change it to `&mut self` instead.
 */
impl LRUCache {
    fn new(capacity: i32) -> Self {
        Self { map: HashMap::new(), list: LinkedList::new() } }
    }

    fn get(&self, key: i32) -> i32 {

    }

    fn put(&self, key: i32, value: i32) {
        let value_in_hash = self.map.get(&key);
    }
}
