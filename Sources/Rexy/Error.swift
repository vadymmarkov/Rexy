public struct Error: ErrorProtocol {

  public let description: String

  /**
   Creates a new regex error

   - Parameter result: Compiled result
   - Parameter preg: The structure
   */
  public init(from result: Int32, compiledPattern: regex_t) {
    var compiledPattern = compiledPattern
    var buffer = [Int8](repeating: 0, count: Int(BUFSIZ))

    regerror(result, &compiledPattern, &buffer, buffer.count)
    description = String(validatingUTF8: buffer) ?? ""
  }
}
