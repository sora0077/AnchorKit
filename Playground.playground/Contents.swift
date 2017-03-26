//: Playground - noun: a place where people can play

import UIKit
import AnchorKit
import PlaygroundSupport

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = UIView()
        let b = UIView()
        a.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        a.backgroundColor = .yellow
        b.backgroundColor = .blue
        view.addSubview(a); view.addSubview(b)
        constrain(a, b) { (a, b) in
            a.size == 200 <- .priority(UILayoutPriorityDefaultHigh)
            a.top == a.superview.top
            a.leading == a.superview.leading

            b.top == a.bottom
            b.leading == a.trailing
            b.size == a.size / 2
        }
    }
}

PlaygroundPage.current.liveView = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
