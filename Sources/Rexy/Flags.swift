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


/**
 Flags used to determine the type of compilation (cflag).
 */
public struct CompilationFlags: OptionSet {

  /// Raw value
  public let rawValue: Int32

  /**
   Creates a new flag

   - Parameter rawValue: value
   */
  public init(rawValue: Int32) {
    self.rawValue = rawValue
  }

  /// Use POSIX Basic Regular Expression syntax.
  public static let basic = CompilationFlags(rawValue: REG_BASIC)

  /// Use POSIX Extended Regular Expression syntax.
  public static let extended = CompilationFlags(rawValue: REG_EXTENDED)

  /// Do not differentiate case.
  public static let caseInsensitive = CompilationFlags(rawValue: REG_ICASE)

  /// Do not report position of matches.
  public static let noPositions = CompilationFlags(rawValue: REG_NOSUB)

  // Newline-sensitive matching.
  public static let newLineSensitive = CompilationFlags(rawValue: REG_NEWLINE)

  /// Match-any-character operators don't match a newline.
  public static let newline = CompilationFlags(rawValue: REG_NEWLINE)

  /// Do not report position of matches.
  public static let noSpecialCharacters = CompilationFlags(rawValue: REG_NOSPEC)

  /// Interpret the entire regex argument as a literal string
  public static let literal = CompilationFlags(rawValue: REG_LITERAL)

  /// Point to the end of the expression to compile
  public static let endPointer = CompilationFlags(rawValue: REG_PEND)

  /// Compile using minimal repetition
  public static let minimal = CompilationFlags(rawValue: REG_MINIMAL)

  /// Make the operators non-greedy by default and greedy when a ? is specified
  public static let nonGreedy = CompilationFlags(rawValue: REG_UNGREEDY)
}
