//
//  AnimationTypes.swift
//  CustomPresentation
//
//  Created by Sergey Kozlov on 18.12.2024.
//

import UIKit

enum AnimationTypes
{
    case rollFromLeft
    case rollFromBottom
}


internal extension AnimationTypes {
    func startState(finalFrame: CGRect) -> CGAffineTransform {
        switch self {
        case .rollFromLeft:
            return CGAffineTransform(rotationAngle: CGFloat.pi).translatedBy(x: 0, y: finalFrame.height)
        case .rollFromBottom:
            return CGAffineTransform(rotationAngle: 0).translatedBy(x: 0, y: finalFrame.height)
        }
    }
}

internal struct TransformForAnimation {
    var position: CGPoint
    var rotation: CGFloat
}
