//
//  PieChartVeiw.swift
//  Otus
//
//  Created by Олег Иванов on 25/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

struct Segment {
    let color: UIColor
    let title: String
}

class SegmentCircleLayer: CAShapeLayer {
    private static let keyPath = "strokeEnd"
    private static let keyAnimation = "strokeEndAnimation"
    
    func startAnimate() {
        let pathAnimation = CABasicAnimation(keyPath: SegmentCircleLayer.keyPath)
        pathAnimation.duration = 2.0;
        pathAnimation.fromValue = 0.0;
        pathAnimation.toValue = 1.0;
        self.add(pathAnimation, forKey: SegmentCircleLayer.keyAnimation)
    }
    
    func stopAnimate() {
        self.removeAnimation(forKey: SegmentCircleLayer.keyAnimation)
    }
}

class PieChartVeiw: UIView {
    private lazy var textAttributes: [NSAttributedString.Key: Any] = [
        .font               : UIFont.systemFont(ofSize: 14),
        .foregroundColor    : UIColor.black
    ]
    
    var segments: [Segment] = []
    
    func show() {
        if segments.isEmpty == false {
            let step: CGFloat = CGFloat(360 / segments.count)
            var fromAngle: CGFloat = 0
            var toAngle: CGFloat = step
            
            for segment in segments {
                addSegmentCircleLayer(fromAngle: fromAngle, toAngle: toAngle, color: segment.color)
                fromAngle = toAngle
                toAngle += step
            }
            
            toAngle = step
            for segment in segments {
                addTextLayer(text: segment.title, toAngle: toAngle)
                toAngle += step
            }
        }
    }
    
    func hide() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    private func addSegmentCircleLayer(fromAngle: CGFloat, toAngle: CGFloat, color: UIColor) {
        let segmentLayer = SegmentCircleLayer()
        segmentLayer.strokeColor = color.cgColor
        segmentLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(segmentLayer)
        
        let startAngle = (fromAngle-90).toRadians()
        let endAngle = (toAngle-90).toRadians()
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 4
        let path = UIBezierPath(arcCenter: CGPoint(x: 0,y :0), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        segmentLayer.position = center
        segmentLayer.lineWidth = radius * 2
        segmentLayer.path = path.cgPath

        segmentLayer.startAnimate()
    }
    
    private func addTextLayer(text: String, toAngle: CGFloat) {
        let endAngle = (toAngle-90).toRadians()
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 4
        let textSize = text.size(withAttributes: textAttributes)
        
        let textlayer = CATextLayer()
        
        // NOTE: не совсем верное определение центра сегмента, времени шлифовать нет... :(
        textlayer.frame = CGRect(x: center.x - (textSize.width / 2) + radius * cos(endAngle), y: center.y - (textSize.height / 2) + -(radius * sin(endAngle)), width: textSize.width, height: textSize.height)
        
        textlayer.fontSize = 12
        textlayer.alignmentMode = .center
        textlayer.string = text
        textlayer.isWrapped = true
        textlayer.truncationMode = .end
        textlayer.backgroundColor = UIColor.clear.cgColor
        textlayer.foregroundColor = UIColor.black.cgColor
        
        layer.addSublayer(textlayer)
    }
}
