//
//  PriorityDescriptor.swift
//  AnchorKit
//
//  Created by 林達也 on 2017/03/26.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import UIKit

public enum PriorityDescriptor {
    case priorityRequired
    case priorityHigh
    case priorityLow
    case priorityFittingSizeLevel
    case priority(UILayoutPriority)

    var value: UILayoutPriority {
        switch self {
        case .priorityRequired: return UILayoutPriorityRequired
        case .priorityHigh: return UILayoutPriorityDefaultHigh
        case .priorityLow: return UILayoutPriorityDefaultLow
        case .priorityFittingSizeLevel: return UILayoutPriorityFittingSizeLevel
        case .priority(let value): return value
        }
    }
}

precedencegroup Base {
    associativity: left
    lowerThan: ComparisonPrecedence
}

infix operator <-: Base

// MARK: -
@discardableResult
public func <- (lhs: NSLayoutConstraint, rhs: PriorityDescriptor) -> NSLayoutConstraint {
    lhs.priority = rhs.value
    return lhs
}

@discardableResult
public func <- (lhs: (NSLayoutConstraint, NSLayoutConstraint), rhs: PriorityDescriptor) -> (NSLayoutConstraint, NSLayoutConstraint) {
    lhs.0.priority = rhs.value
    lhs.1.priority = rhs.value
    return lhs
}
