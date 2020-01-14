![Rexy](https://github.com/vadymmarkov/Rexy/blob/master/Images/RexyPresentation.png)

[![CI Status](http://img.shields.io/travis/vadymmarkov/Rexy.svg?style=flat)](https://travis-ci.org/vadymmarkov/Rexy)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Swift](https://img.shields.io/badge/in-Swift%205.1-brightgreen.svg)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

**Rexy** is a pure Swift implementation of POSIX Regular Expressions.

## Features

- [x] Pattern matching
- [x] Capturing groups
- [x] Replace method
- [x] Matching operators
- [x] Representation of a regular expression error
- [x] Option sets with default constants for compilation flags (`cflag`) and regex matching flags (`eflag`)
- [x] Unit test coverage
- [x] No dependencies

## Usage

### Pattern matching

When you want to check if a given string matches regular expression:

```swift
import Rexy

// Regular way
do {
  let regex = try Regex("Tyrannosaurus")
  regex.isMatch("Tyrannosaurus") // => true
  regex.isMatch("Spinosaurus") // => false
} catch {
  print(error)
}

// With custom operators
"Tyrannosaurus" =~ "T.*" // true
"Spinosaurus" =~ "T.*" // false
"Spinosaurus" !~ "T.*" // true
```

### Matches

When you want to search an input string for all occurrences of a regular
expression and get the matches:

```swift
import Rexy

do {
  let regex = try Regex("[a-z]+")
  regex.matches("a1b1") // ["a", "b"])
} catch {
  print(error)
}
```

When you're interested only in the first occurrence:

```swift
import Rexy

do {
  let regex = try Regex("[a-z]+")
  regex.matches("a1b1") // "a"
} catch {
  print(error)
}
```

### Capturing Groups

When you want to match and capture groups:

```swift
import Rexy

do {
  let regex = try Regex("(Tyrannosaurus) (Rex)")
  regex.groups("Tyrannosaurus Rex") // => ["Tyrannosaurus", "Rex"]
  regex.groups("Spinosaurus") // => []
} catch {
  print(error)
}
```

### Replace

When you want to replace all strings that match a regular expression pattern
with a specified replacement string:

```swift
import Rexy

do {
  let regex = try! Regex("Tyrannosaurus")
  regex.replace("Tyrannosaurus Rex Tyrannosaurus", with: "Dinosaur") // => "Dinosaur Rex Dinosaur"
  regex.replace("Spinosaurus", with: "Dinosaur") // => Spinosaurus
} catch {
  print(error)
}
```

## Installation

`Rexy` is available through [Swift Package Manager](https://github.com/apple/swift-package-manager).
To install it, simply add the following lines to your `Package.swift`:

```swift
.Package(url: "https://github.com/vadymmarkov/Rexy.git", versions: Version(0,1,0)..<Version(1,0,0))
```
Alternatively, you can install it in your Xcode project by adding a Swift package dependency.

## Author

Vadym Markov, markov.vadym@gmail.com

## Credits

Credits for inspiration go to [POSIXRegex](https://github.com/Zewo/POSIXRegex)
by [Zewo](https://github.com/Zewo)

## Contributing

Check the [CONTRIBUTING](https://github.com/vadymmarkov/Rexy/blob/master/CONTRIBUTING.md)
file for more info.

## License

**Rexy** is available under the MIT license. See the [LICENSE](https://github.com/vadymmarkov/Rexy/blob/master/LICENSE.md) file for more info.
