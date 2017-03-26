//
//  Constant.swift
//  AnchorKit
//
//  Created by 林達也 on 2017/03/26.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import UIKit

public struct Constant: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    fileprivate let value: CGFloat

    public init(integerLiteral value: UInt) {
        self.value = CGFloat(value)
    }

    public init(floatLiteral value: Float) {
        self.value = CGFloat(value)
    }
}

// MARK: - NSLayoutDimension with constant
@discardableResult
public func == <T: NSLayoutDimension>(lhs: Anchor<T>, rhs: Constant) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(equalToConstant: rhs.value)
    lhs.group.install(c)
    return c
}

@discardableResult
public func >= <T: NSLayoutDimension>(lhs: Anchor<T>, rhs: Constant) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(greaterThanOrEqualToConstant: rhs.value)
    lhs.group.install(c)
    return c
}

@discardableResult
public func <= <T: NSLayoutDimension>(lhs: Anchor<T>, rhs: Constant) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(lessThanOrEqualToConstant: rhs.value)
    lhs.group.install(c)
    return c
}

// MARK: -

@discardableResult
public func == <T: NSLayoutDimension, U: NSLayoutDimension>(lhs: CompoundAnchor<T, U>, rhs: Constant) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 == rhs, lhs.anchor2 == rhs)
}

@discardableResult
public func >= <T: NSLayoutDimension, U: NSLayoutDimension>(lhs: CompoundAnchor<T, U>, rhs: Constant) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 >= rhs, lhs.anchor2 >= rhs)
}

@discardableResult
public func <= <T: NSLayoutDimension, U: NSLayoutDimension>(lhs: CompoundAnchor<T, U>, rhs: Constant) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 <= rhs, lhs.anchor2 <= rhs)
}
