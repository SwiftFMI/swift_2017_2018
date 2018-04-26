class Scientist {
    let name: String
    var degree: String
    
    var experience: Int = 0
    
    init(name: String, degree: String) {
        self.name = name
        self.degree = degree
    }
}

class Physicist: Scientist {
    override var experience: Int {
        didSet {
            print("The Physicist has become more experienced! Previously they had: \(oldValue) years of experience.")
        }
    }
}

class Astrophysicist: Physicist { }

let p = Physicist(name: "Albert", degree: "Professor")
p.experience += 1
p.experience += 1
