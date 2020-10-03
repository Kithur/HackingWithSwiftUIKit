import UIKit

let string = "This is a test string"

let attributedString = NSMutableAttributedString(string: string)

attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))

extension String {
    
    func withPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return prefix + self }
        return self
    }
}

var a = "abcdef"
a.withPrefix("123")

extension String {
    
    func isNumeric() -> Bool {
        guard let _ = Double(self) else { return false }
        return true
    }
}

let n = "123"

let n1 = "abc123"

n.isNumeric()

n1.isNumeric()

extension String {
    
    func lines() -> Array<String> {
        if self.contains("\n") {
            let array = self.components(separatedBy: "\n")
            return array
        }
        return [self]
    }
}

var strike = """
What are
you talking
about
"""

strike.lines()

extension UIView {
    
    func bounceOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [unowned self] in
        self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

let vc = UIViewController()
vc.view.bounceOut(duration: 2.0)

extension Int {
    
    func times(closure: () -> Void) {
        if self < 0 {
            var integer = self
            integer *= -1
            
            for _ in 1...integer {
                closure()
            }
        } else {
            let integer = self
            
            for _ in 1...integer {
                closure()
            }
        }
        
    }
}

5.times {
    print("Hi")
}

let count = -3

count.times {
    print("Hi there")
}

extension Array where Element: Comparable {
    mutating func remove(item: Element) {
        if let location = self.firstIndex(of: item) {
            self.remove(at: location)
        }
    }
    
}
