//
//  AnimationTypes.swift
//  CustomPresentation
//
//  Created by Sergey Kozlov on 18.12.2024.
//

import UIKit

enum PresentAnimationTypes
{
    case rollFromLeft
    case rollFromBottom
}

enum DismissAnimationTypes
{
    case toLeft
    case toRight
}

internal extension PresentAnimationTypes {
    func startState(finalFrame: CGRect) -> AnimationTransform {
        switch self {
        case .rollFromLeft:
            return AnimationTransform(offset: CGPoint(x: -finalFrame.width, y: 0), rotation: CGFloat.pi)
        case .rollFromBottom:
            return AnimationTransform(offset: CGPoint(x: 0, y: finalFrame.height), rotation: CGFloat.pi)
        }
    }
}

internal extension DismissAnimationTypes {
    func finalState(finalFrame: CGRect) -> AnimationTransform {
        switch self {
        case .toLeft:
            return AnimationTransform(offset: CGPoint(x: -finalFrame.width, y: 0), rotation: 0)
        case .toRight:
            return AnimationTransform(offset: CGPoint(x: finalFrame.width, y: 0), rotation: 0)
        }
    }
}

internal struct AnimationTransform {
    var offset: CGPoint
    var rotation: CGFloat
}
