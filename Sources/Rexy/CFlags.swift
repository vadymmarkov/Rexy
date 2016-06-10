#if os(Linux)
  @_exported import Glibc
#else
  @_exported import Darwin.C
#endif

public extension Regex {

  /**
   Flags used to determine the type of compilation (cflag).
   */
  public struct CFlags: OptionSet {

    /// Raw value.
    public let rawValue: Int32

    /**
     Creates a new cflag.

     - Parameter rawValue: The value.
     */
    public init(rawValue: Int32) {
      self.rawValue = rawValue
    }

    /// Use POSIX Basic Regular Expression syntax.
    public static let basic = CFlags(rawValue: REG_BASIC)

    /// Use POSIX Extended Regular Expression syntax.
    public static let extended = CFlags(rawValue: REG_EXTENDED)

    /// Do not differentiate case.
    public static let caseInsensitive = CFlags(rawValue: REG_ICASE)

    /// Do not report position of matches.
    public static let noPositions = CFlags(rawValue: REG_NOSUB)

    // Newline-sensitive matching.
    public static let newLineSensitive = CFlags(rawValue: REG_NEWLINE)

    /// Do not report position of matches.
    public static let noSpecialCharacters = CFlags(rawValue: REG_NOSPEC)

    /// Interpret the entire regex argument as a literal string.
    public static let literal = CFlags(rawValue: REG_LITERAL)

    /// Point to the end of the expression to compile.
    public static let endPointer = CFlags(rawValue: REG_PEND)

    /// Compile using minimal repetition.
    public static let minimal = CFlags(rawValue: REG_MINIMAL)

    /// Make the operators non-greedy by default and greedy when a ? is specified.
    public static let nonGreedy = CFlags(rawValue: REG_UNGREEDY)
  }
}
