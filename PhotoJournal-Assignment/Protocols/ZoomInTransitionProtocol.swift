//
//  ZoomInTransitionProtocol.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/8/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit

protocol ZoomingViewController{
    func ZoomingImageView(for transition:ZoomInTransitonDelegate)-> UIImageView?
    
}
