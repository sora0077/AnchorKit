//
//  LayoutProxy.swift
//  AnchorKit
//
//  Created by 林達也 on 2017/03/26.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import UIKit

public protocol LayoutProxy {
    var width: Anchor<NSLayoutDimension> { get }

    var height: Anchor<NSLayoutDimension> { get }

    var leading: Anchor<NSLayoutXAxisAnchor> { get }

    var trailing: Anchor<NSLayoutXAxisAnchor> { get }

    var left: Anchor<NSLayoutXAxisAnchor> { get }

    var right: Anchor<NSLayoutXAxisAnchor> { get }

    var top: Anchor<NSLayoutYAxisAnchor> { get }

    var bottom: Anchor<NSLayoutYAxisAnchor> { get }

    var centerX: Anchor<NSLayoutXAxisAnchor> { get }

    var centerY: Anchor<NSLayoutYAxisAnchor> { get }

    var center: CompoundAnchor<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor> { get }

    var size: CompoundAnchor<NSLayoutDimension, NSLayoutDimension> { get }

    var superview: LayoutProxy! { get }
}

extension LayoutProxy {
    var center: CompoundAnchor<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor> {
        return CompoundAnchor(centerX, centerY)
    }

    var size: CompoundAnchor<NSLayoutDimension, NSLayoutDimension> {
        return CompoundAnchor(width, height)
    }
}

final class ViewProxy: LayoutProxy {
    var width: Anchor<NSLayoutDimension> {
        return Anchor(group, view.widthAnchor)
    }

    var height: Anchor<NSLayoutDimension> {
        return Anchor(group, view.heightAnchor)
    }

    var leading: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, view.leadingAnchor)
    }

    var trailing: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, view.trailingAnchor)
    }

    var left: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, view.leftAnchor)
    }

    var right: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, view.rightAnchor)
    }

    var top: Anchor<NSLayoutYAxisAnchor> {
        return Anchor(group, view.topAnchor)
    }

    var bottom: Anchor<NSLayoutYAxisAnchor> {
        return Anchor(group, view.bottomAnchor)
    }

    var centerX: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, view.centerXAnchor)
    }

    var centerY: Anchor<NSLayoutYAxisAnchor> {
        return Anchor(group, view.centerYAnchor)
    }

    private(set) lazy var superview: LayoutProxy! = {
        self.view.superview.map { ViewProxy(self.group, $0) }
    }()

    private let group: ConstraintGroup
    private let view: UIView

    init(_ group: ConstraintGroup, _ view: UIView) {
        (self.group, self.view) = (group, view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

final class LayoutGuideProxy: LayoutProxy {
    var width: Anchor<NSLayoutDimension> {
        return Anchor(group, guide.widthAnchor)
    }

    var height: Anchor<NSLayoutDimension> {
        return Anchor(group, guide.heightAnchor)
    }

    var leading: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, guide.leadingAnchor)
    }

    var trailing: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, guide.trailingAnchor)
    }

    var left: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, guide.leftAnchor)
    }

    var right: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, guide.rightAnchor)
    }

    var top: Anchor<NSLayoutYAxisAnchor> {
        return Anchor(group, guide.topAnchor)
    }

    var bottom: Anchor<NSLayoutYAxisAnchor> {
        return Anchor(group, guide.bottomAnchor)
    }

    var centerX: Anchor<NSLayoutXAxisAnchor> {
        return Anchor(group, guide.centerXAnchor)
    }

    var centerY: Anchor<NSLayoutYAxisAnchor> {
        return Anchor(group, guide.centerYAnchor)
    }

    private(set) lazy var superview: LayoutProxy! = {
        self.guide.owningView?.superview.map { ViewProxy(self.group, $0) }
    }()

    private let group: ConstraintGroup
    private let guide: UILayoutGuide

    init(_ group: ConstraintGroup, _ guide: UILayoutGuide) {
        (self.group, self.guide) = (group, guide)
    }
}
