#if os(Linux)
  @_exported import Glibc
#else
  @_exported import Darwin.C
#endif

/**
 POSIX regex matching flags (eflag).
 */
public struct MatchFlags: OptionSet {

  /// Raw value
  public let rawValue: Int32

  /**
   Creates a new flag

   - Parameter rawValue: value
   */
  public init(rawValue: Int32) {
    self.rawValue = rawValue
  }

  /// First character not at beginning of line
  public static let notAtBeginningOfLine = MatchFlags(rawValue: REG_NOTBOL)

  /// Last character not at end of line
  public static let notAtEndOfLine = MatchFlags(rawValue: REG_NOTEOL)

  /// String start/end in pmatch[0]
  public static let startEnd = MatchFlags(rawValue: REG_STARTEND)

  /// Force use of backref code
  public static let backref = MatchFlags(rawValue: REG_BACKR)
}
