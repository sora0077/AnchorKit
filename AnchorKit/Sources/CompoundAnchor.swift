//
//  CompoundAnchor.swift
//  AnchorKit
//
//  Created by 林達也 on 2017/03/26.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import UIKit

public final class CompoundAnchor<AnchorType1, AnchorType2> {

    let anchor1: Anchor<AnchorType1>
    let anchor2: Anchor<AnchorType2>

    init(_ anchor1: Anchor<AnchorType1>, _ anchor2: Anchor<AnchorType2>) {
        (self.anchor1, self.anchor2) = (anchor1, anchor2)
    }
}

public func + <T, U>(lhs: CompoundAnchor<T, U>, rhs: CGFloat) -> CompoundAnchor<T, U> {
    _ = lhs.anchor1 + rhs
    _ = lhs.anchor2 + rhs
    return lhs
}

public func - <T, U>(lhs: CompoundAnchor<T, U>, rhs: CGFloat) -> CompoundAnchor<T, U> {
    _ = lhs.anchor1 - rhs
    _ = lhs.anchor2 - rhs
    return lhs
}

public func * <T, U>(lhs: CompoundAnchor<T, U>, rhs: CGFloat) -> CompoundAnchor<T, U> {
    _ = lhs.anchor1 * rhs
    _ = lhs.anchor2 * rhs
    return lhs
}

public func / <T, U>(lhs: CompoundAnchor<T, U>, rhs: CGFloat) -> CompoundAnchor<T, U> {
    _ = lhs.anchor1 / rhs
    _ = lhs.anchor2 / rhs
    return lhs
}

// MARK: - NSLayoutXAxisAnchor, NSLayoutYAxisAnchor
@discardableResult
public func == <T: NSLayoutXAxisAnchor, U: NSLayoutYAxisAnchor>(lhs: CompoundAnchor<T, U>, rhs: CompoundAnchor<T, U>) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 == rhs.anchor1, lhs.anchor2 == rhs.anchor2)
}

// MARK: - NSLayoutDimension
@discardableResult
public func == <T: NSLayoutDimension, U: NSLayoutDimension>(lhs: CompoundAnchor<T, U>, rhs: CompoundAnchor<T, U>) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 == rhs.anchor1, lhs.anchor2 == rhs.anchor2)
}

@discardableResult
public func >= <T: NSLayoutDimension, U: NSLayoutDimension>(lhs: CompoundAnchor<T, U>, rhs: CompoundAnchor<T, U>) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 >= rhs.anchor1, lhs.anchor2 >= rhs.anchor2)
}

@discardableResult
public func <= <T: NSLayoutDimension, U: NSLayoutDimension>(lhs: CompoundAnchor<T, U>, rhs: CompoundAnchor<T, U>) -> (NSLayoutConstraint, NSLayoutConstraint) {
    return (lhs.anchor1 <= rhs.anchor1, lhs.anchor2 <= rhs.anchor2)
}
