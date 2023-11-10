struct TimesTable {
    var multiplier = 0
    subscript(index: Int) -> Int {
        return index * multiplier
    }
}

let threeTimesTable = TimesTable(multiplier: 3)

print(threeTimesTable[3])

struct Matrix {
    var rows:Int, columns:Int
    var grid: [Double]

    init(rows: Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    func isIndexValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            assert(isIndexValid(row: row, column: column), "Index out of range")
            return grid[row * columns + column]
        }
        set {
            assert(isIndexValid(row: row, column: column), "Index out of range")
            grid[row * columns + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 2.5

print(matrix[0, 1])

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript (index: Int) -> Planet {
        return Planet(rawValue: index)!
    }
}

let mars = Planet[4]

print(mars)