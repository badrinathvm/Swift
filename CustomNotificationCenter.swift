typealias CallBack = (_ name: String , _ data: Any) -> Void

protocol NotificationObserver {
    func add(name:String, using block: @escaping CallBack)
    func remove(name: String)
    func post(name: String, using block: Any)
}

class NotificationObserverImpl: NotificationObserver {
    
   var observations = [String: [CallBack]]()
    
    func add(name: String, using block: @escaping CallBack) {
        guard var observe = observations[name] else {
            observations[name] = [block]
            return
        }
        
        //since there is already one observer withe name, append it to the array.
        observe.append(block)
        observations[name] = observe
    }
    
    func post(name: String, using block: Any) {
        let observe = observations[name]
        observe?.forEach{ (value) in
            value(name, block)
        }
    }

    func remove(name: String) {
        observations.removeValue(forKey: name)
    }
    
    deinit {
        observations.removeAll()
    }
}

let notificationObserver = NotificationObserverImpl()
notificationObserver.add(name: "Hello") { (name, result) in
    print("\(name) \(result)")
}

notificationObserver.post(name: "Hello", using: [1,2,3])
