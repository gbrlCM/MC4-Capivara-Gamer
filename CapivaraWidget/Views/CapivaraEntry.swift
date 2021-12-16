//  TimelineEntry.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import Foundation
import UIKit
import WidgetKit

struct CapivaraEntry: TimelineEntry {
    var date: Date
    let event: Event
    var image: UIImage?
}

