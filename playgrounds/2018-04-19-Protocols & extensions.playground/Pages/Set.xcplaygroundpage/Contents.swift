class Wallet {
    var money: Int = 0 {
        willSet {
            print("New money coming in : \(newValue)")
        }
        didSet {
            if oldValue != money {
                if oldValue > money {
                    print("Oh!")
                } else {
                    print("Yay!")
                }
            }
        }
    }
    
    init(money: Int) {
        self.money = money
    }
}

let w = Wallet(money: 1)
w.money = 4
w.money -= 3
