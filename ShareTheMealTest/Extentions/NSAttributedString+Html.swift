//
//  NSAttributedString+Html.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 15.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import UIKit

public extension NSAttributedString {
    struct ConvertToDataError: Error {}

    convenience init(html: String) throws {
        guard let htmlData = html.data(using: .utf8) else { throw ConvertToDataError() }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        let trimmedHtml = try NSAttributedString(data: htmlData, options: options, documentAttributes: nil).trimmTrailingNewLine()
        self.init(attributedString: trimmedHtml)
    }

    private func trimmTrailingNewLine() -> NSAttributedString {
        if string.hasSuffix("\n") {
            return attributedSubstring(from: NSRange(location: 0, length: length - 1)).trimmTrailingNewLine()
        } else {
            return self
        }
    }
}
