//
//  DiagonalCustomView.swift
//  codeView
//
//  Created by 정환우 on 2021/01/10.
//

import UIKit


@IBDesignable   // 내가 만든 커스텀 코드를 스토리보드에서 바로 확인할 수 있게 해줌.
class DiagonalCustomView: UIImageView {
    
    // 대각선으로 잘린 사각형을 그린다.
    // bezierPath
    
    // path -> layer
    
    // layer -> mask
    
    @IBInspectable var innerHeight: CGFloat = 0  // 스토리보드에서 편집할 수 있게 해줌.
    
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    
    func pathtoLayer() -> CAShapeLayer {
        let newLayer = CAShapeLayer()
        newLayer.path = makePath().cgPath
        
        return newLayer
    }
    
    func makeMask(){
        self.layer.mask = pathtoLayer()
    }
    
    override func layoutSubviews() {    // 레이어가 나타날 때 실행되는 코드
        makeMask()
    }
}
