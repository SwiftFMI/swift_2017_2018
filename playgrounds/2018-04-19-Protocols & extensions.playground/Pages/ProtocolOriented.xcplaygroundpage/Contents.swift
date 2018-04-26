protocol Drawable {
    var strokeWidth: Int {get set}
    var strokeColor: String {get set}
    var fillColor: String {get set}

    func draw(with context: DrawingContext)
}

protocol DrawingContext {
    func draw(_ circle: Circle)
    func draw(_ square: Square)
}

class Circle: Drawable {
    var strokeWidth = 2
    var strokeColor = "red"
    var fillColor = "yellow"

    var center = (x: 40.0, y: 40.0)
    var radius = 20.0

    func draw(with context: DrawingContext) {
        context.draw(self)
    }
}

extension Circle: CustomStringConvertible {
    var description: String {
        return "Circle(withCenter: \(center.x),\(center.y), radius: \(radius), strokeWidth: \(strokeWidth), strokeColor: \(strokeColor), fillColor: \(fillColor))"
    }
}

class Square: Drawable {
    var strokeWidth = 0
    var strokeColor = ""
    var fillColor = "black"

    var origin = (x: 80.0, y: 80.0)
    var side = 30.0

    func draw(with context: DrawingContext) {
        context.draw(self)
    }
}

extension Square: CustomStringConvertible {
    var description: String {
        return "Square(withOrigin: \(origin.x), \(origin.y), side: \(side), strokeWidth: \(strokeWidth), strokeColor: \(strokeColor), fillColor: \(fillColor))"
    }
}

final class StringContext: DrawingContext {
    func draw(_ circle: Circle) {
        print(circle)
    }

    func draw(_ square: Square) {
        print(square)
    }
}

let drawingContext = StringContext()

let shapes: [Drawable] = [Circle(), Square()]

for shape in shapes {
    shape.draw(with: drawingContext)
}
