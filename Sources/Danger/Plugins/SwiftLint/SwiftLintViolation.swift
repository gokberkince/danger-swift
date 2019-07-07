public struct SwiftLintViolation: Decodable {
    enum Severity: String, Decodable {
        case warning = "Warning"
        case error = "Error"
    }

    var ruleID: String
    var reason: String
    var line: Int
    var severity: Severity
    var type: String
    var file: String

    var messageText: String {
        return reason + " (`\(ruleID)`)"
    }

    enum CodingKeys: String, CodingKey {
        case ruleID = "rule_id"
        case reason, line, file, severity, type
    }

    public func toMarkdown() -> String {
        let formattedFile = file.split(separator: "/").last! + ":\(line)"
        return "\(severity.rawValue) | \(formattedFile) | \(messageText) |"
    }
}

/*
 "rule_id" : "opening_brace",
 "reason" : "Opening braces should be preceded by a single space and on the same line as the declaration.",
 "character" : 39,
 "file" : "\/Users\/ash\/bin\/Harvey\/Sources\/Harvey\/Harvey.swift",
 "severity" : "Warning",
 "type" : "Opening Brace Spacing",
 "line" : 8
 */
