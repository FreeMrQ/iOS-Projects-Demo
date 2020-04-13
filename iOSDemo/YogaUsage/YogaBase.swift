//
//  YogaBase.swift
//  iOSDemo
//
//  Created by Ronds on 2020/4/8.
//  Copyright © 2020 lance. All rights reserved.
//

import UIKit
import YogaKit

class YogaBase: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black;
        view.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.width = YGValue(self.view.bounds.size.width);
            layout.height = YGValue(self.view.bounds.size.height) ;
            layout.justifyContent = .flexStart;
        };
        
        //头部视图
        let topIV = UIView(frame: .zero);
        topIV.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.marginTop = YGValue((self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height) ;
            
        };
        view.addSubview(topIV);
        
        
        let episodeImageView = UIImageView(frame: .zero);
        episodeImageView.backgroundColor = .gray;
        
    
        
        let image = UIImage(named: "sherlock");
        episodeImageView.image = image;
        
        let imageWidth = image?.size.width ?? 1.0;
        let imageHeight = image?.size.height ?? 1.0;
        
        episodeImageView.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.flexGrow = 1.0;
            layout.aspectRatio = imageWidth/imageHeight;
        }
        topIV.addSubview(episodeImageView);
        
        //概览
        let summaryView = UIView(frame: .zero);
        summaryView.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.flexDirection = .row;
        }
        view.addSubview(summaryView);
        
        let summaryPopularLabel1 = UILabel(frame: .zero);
        summaryPopularLabel1.text = String(repeating: "★", count: 5);
        summaryPopularLabel1.textColor = .red;
        summaryPopularLabel1.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.flexGrow = 1;
        };
        summaryView.addSubview(summaryPopularLabel1);
        
        let summaryPopularLabel2 = UILabel(frame: .zero);
        summaryPopularLabel2.text = "2010";
        summaryPopularLabel2.textColor = .white;
        summaryPopularLabel2.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.flexGrow = 1;
        };
        summaryView.addSubview(summaryPopularLabel2);
        
        let summaryPopularLabel3 = UILabel(frame: .zero);
        summaryPopularLabel3.text = "TV-14";
        summaryPopularLabel3.textColor = .white;
        summaryPopularLabel3.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.flexGrow = 1;
        };
        summaryView.addSubview(summaryPopularLabel3);
        
        let summaryPopularLabel4 = UILabel(frame: .zero);
        summaryPopularLabel4.text = "3 Series";
        summaryPopularLabel4.textColor = .white;
        summaryPopularLabel4.configureLayout { (layout) in
            layout.isEnabled = true;
            layout.flexGrow = 1;
        };
        summaryView.addSubview(summaryPopularLabel4);
        
        view.yoga.applyLayout(preservingOrigin: true);
        
        
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator);
        view.configureLayout { (layout) in
            layout.width = YGValue(size.width);
            layout.height = YGValue(size.height);
            
        }
        
        view.yoga.applyLayout(preservingOrigin: true);
    }
}
