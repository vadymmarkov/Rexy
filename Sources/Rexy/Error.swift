#if os(Linux)
  @_exported import Glibc
#else
  @_exported import Darwin.C
#endif

/**
 Representation of Regular Expression error.
 */
public struct Error: ErrorProtocol {

  /// Error description.
  public let description: String

  /**
   Creates a new regex error.

   - Parameter result: Compiled result.
   - Parameter compiledPattern: Compiled regex pattern.
   */
  public init(from result: Int32, compiledPattern: regex_t) {
    var compiledPattern = compiledPattern
    var buffer = [Int8](repeating: 0, count: Int(BUFSIZ))

    regerror(result, &compiledPattern, &buffer, buffer.count)
    description = String(validatingUTF8: buffer) ?? ""
  }
}
