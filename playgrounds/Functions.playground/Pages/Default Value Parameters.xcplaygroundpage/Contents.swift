import Foundation

func countDown(from: Int, to: Int = 1) {
    for count in (to...from).reversed() {
        print(count)
        sleep(1)
    }
}

countDown(from: 10)
