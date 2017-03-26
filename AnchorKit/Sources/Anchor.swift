//
//  Anchor.swift
//  AnchorKit
//
//  Created by 林達也 on 2017/03/26.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import UIKit

public final class Anchor<AnchorType> {
    let group: ConstraintGroup
    let anchor: AnchorType
    fileprivate var multiplier: CGFloat = 1
    fileprivate var constant: CGFloat = 0

    init(_ group: ConstraintGroup, _ anchor: AnchorType) {
        (self.group, self.anchor) = (group, anchor)
    }
}

public func + <T>(lhs: Anchor<T>, rhs: CGFloat) -> Anchor<T> {
    lhs.constant = rhs
    return lhs
}

public func - <T>(lhs: Anchor<T>, rhs: CGFloat) -> Anchor<T> {
    lhs.constant = -rhs
    return lhs
}

public func * <T>(lhs: Anchor<T>, rhs: CGFloat) -> Anchor<T> {
    lhs.multiplier *= rhs
    return lhs
}

public func / <T>(lhs: Anchor<T>, rhs: CGFloat) -> Anchor<T> {
    lhs.multiplier /= rhs
    return lhs
}

// MARK: - NSLayoutXAxisAnchor
@discardableResult
public func == <T: NSLayoutXAxisAnchor>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func >= <T: NSLayoutXAxisAnchor>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func <= <T: NSLayoutXAxisAnchor>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

// MARK: - NSLayoutYAxisAnchor
@discardableResult
public func == <T: NSLayoutYAxisAnchor>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func >= <T: NSLayoutYAxisAnchor>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func <= <T: NSLayoutYAxisAnchor>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func == <T: NSLayoutDimension>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(equalTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func >= <T: NSLayoutDimension>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(greaterThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    lhs.group.install(c)
    return c
}

@discardableResult
public func <= <T: NSLayoutDimension>(lhs: Anchor<T>, rhs: Anchor<T>) -> NSLayoutConstraint {
    let c = lhs.anchor.constraint(lessThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
    lhs.group.install(c)
    return c
}
