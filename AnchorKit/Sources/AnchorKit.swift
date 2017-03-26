//
//  AnchorKit.swift
//  AnchorKit
//
//  Created by 林達也 on 2017/03/26.
//  Copyright © 2017年 jp.sora0077. All rights reserved.
//

import UIKit

public final class ConstraintGroup {
    private var installed: [NSLayoutConstraint] = []

    func install(_ constraint: NSLayoutConstraint) {
        installed.append(constraint)
    }

    func install() {
        installed.forEach { $0.isActive = true }
    }
}

public protocol Layout {
    func layoutProxy(with group: ConstraintGroup) -> LayoutProxy
}

extension UIView: Layout {
    public func layoutProxy(with group: ConstraintGroup) -> LayoutProxy {
        return ViewProxy(group, self)
    }
}

public func constrain(_ v1: Layout,
                      _ closure: (LayoutProxy) -> Void) {
    let group = ConstraintGroup()
    closure(v1.layoutProxy(with: group))
    group.install()
}

public func constrain(_ v1: Layout, _ v2: Layout,
                      _ closure: (LayoutProxy, LayoutProxy) -> Void) {
    let group = ConstraintGroup()
    closure(v1.layoutProxy(with: group), v2.layoutProxy(with: group))
    group.install()
}

public func constrain(_ v1: Layout, _ v2: Layout, _ v3: Layout,
                      _ closure: (LayoutProxy, LayoutProxy, LayoutProxy) -> Void) {
    let group = ConstraintGroup()
    closure(v1.layoutProxy(with: group), v2.layoutProxy(with: group), v3.layoutProxy(with: group))
    group.install()
}

public func constrain(_ v1: Layout, _ v2: Layout, _ v3: Layout, _ v4: Layout,
                      _ closure: (LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy) -> Void) {
    let group = ConstraintGroup()
    closure(v1.layoutProxy(with: group), v2.layoutProxy(with: group), v3.layoutProxy(with: group), v4.layoutProxy(with: group))
    group.install()
}

public func constrain(_ vs: [Layout], _ closure: ([LayoutProxy]) -> Void) {
    let group = ConstraintGroup()
    closure(vs.map { $0.layoutProxy(with: group) })
    group.install()
}
