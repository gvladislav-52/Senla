import Foundation

enum FirstModelType {
    case rock
    case paper
    case scissir
}

class FirstModel {
    static var shared = FirstModel()
    var statusOponentArray: [FirstModelType] = []
    var statusYourArray: [FirstModelType] = []
    
    var statusOponent: FirstModelType!
    var statusYour: FirstModelType!
    static var count: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: .modelCountDidChange, object: nil)
        }
    }
    func statusOponentArray(at index: Int) -> FirstModelType {
        return statusOponentArray[index]
    }
    func statusYourArray(at index: Int) -> FirstModelType {
        return statusYourArray[index]
    }
    
    var statusOponentString: String! {
        switch statusOponent {
        case .rock:
            return "Был Камень"
        case .scissir:
            return "Были Ножницы"
        case .paper:
            return "Была Бумага"
        default:
            return nil
        }
    }
    
    init() {
        statusOponent = nil
        statusYour = nil
    }
    
    func start(number: Int) {
        var array: [Int] = [1, 2, 3]
        array = array.filter { $0 != number }
        let index = Int.random(in: 0..<array.count)
        switch array[index] {
        case 1:
            statusOponent = .paper
        case 2:
            statusOponent = .rock
        case 3:
            statusOponent = .scissir
        default:
            break
        }
    }
    
    func winnerMethod() -> String {
        statusOponentArray.append(statusOponent)
        statusYourArray.append(statusYour)
        FirstModel.count += 1
        if(statusOponent == .rock && statusYour == .paper) {
            return "Your Winner!"
        } else if (statusOponent == .rock && statusYour == .scissir) {
            return "Your Lose!"
        } else if (statusOponent == .rock && statusYour == .rock) {
            return "Draw!"
        }
        
        switch statusOponent {
        case .rock:
            switch statusYour {
            case .paper:
                return "Your Winner!"
            case .scissir:
                return "Your Lose!"
            case .rock:
                return "Draw"
            default:
                return ""
            }
        case .scissir:
            switch statusYour {
            case .rock:
                return "Your Winner!"
            case .paper:
                return "Your Lose!"
            case .scissir:
                return "Draw"
            default:
                return ""
            }
        case .paper:
            switch statusYour {
            case .scissir:
                return "Your Winner!"
            case .rock:
                return "Your Lose!"
            case .paper:
                return "Draw"
            default:
                return ""
            }
        default:
            return ""
        }
    }
}

extension Notification.Name {
    static let modelCountDidChange = Notification.Name("modelCountDidChange")
}
