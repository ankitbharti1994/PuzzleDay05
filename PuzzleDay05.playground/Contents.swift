import Foundation
import PlaygroundSupport


PlaygroundPage.current.needsIndefiniteExecution = true
findSteps(queue: .global(qos: .utility), isSecondPart: true) {
    print("updated list : \($0) and total steps taken : \($1)")
    PlaygroundPage.current.finishExecution()
}
