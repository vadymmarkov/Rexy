#if os(Linux)
  @_exported import Glibc
#else
  @_exported import Darwin.C
#endif

/**
 POSIX regex matching flags (eflag).
 */
public struct EFlags: OptionSet {

  /// Raw value.
  public let rawValue: Int32

  /**
   Creates a new eflag.

   - Parameter rawValue: The value
   */
  public init(rawValue: Int32) {
    self.rawValue = rawValue
  }

  /// First character not at beginning of line.
  public static let notAtBeginningOfLine = EFlags(rawValue: REG_NOTBOL)

  /// Last character not at end of line.
  public static let notAtEndOfLine = EFlags(rawValue: REG_NOTEOL)

  /// String start/end in pmatch[0].
  public static let startEnd = EFlags(rawValue: REG_STARTEND)

  /// Force use of backref code.
  public static let backref = EFlags(rawValue: REG_BACKR)
}
