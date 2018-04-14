//
//  SequenceExtension.swift
//  MemoryGame
//
//  Created by Gabriel Rosa on 14/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
