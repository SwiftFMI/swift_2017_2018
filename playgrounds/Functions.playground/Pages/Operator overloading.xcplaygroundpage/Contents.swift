// Vector
// infix, prefix, postfix, ternary(?!)
// + for vector (x1+x2,y1+y2)
// prefix tuple - !?
// * scalar (left Int, right Vector). (right Int, left Vector) (x*s,y*s)

typealias Vector = (x: Int, y: Int)

let vA = (x: 3, y: 0)
let vB = (x: 2, y: 1)

let vC = (x: vA.x+vB.x, y: vA.y+vB.y)

func add(vector1: Vector, vector2: Vector) -> Vector {
    return (x: vector1.x+vector2.x, y: vector1.y+vector2.y)
}

let vD = add(vector1: vA, vector2: vB)

infix operator +
func +(left: Vector, right: Vector) -> Vector {
    return add(vector1: left, vector2: right)
}

let vE = (vA+vB)+vC

infix operator *
func *(left: Vector, right: Int) -> Vector {
    return (left.x*right, left.y*right)
}

func *(left: Int, right: Vector) -> Vector {
    return right*left
}

let vF = vA*3
let vG = 3*vA

prefix operator -
prefix func -(vector: Vector) -> Vector {
    return (-vector.x, -vector.y)
}

let vH = -vA
