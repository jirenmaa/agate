require "./agate/hello"

module Agate
  VERSION = "0.1.0"

  myGreet = Hello.new
  puts myGreet.time
  puts myGreet.greet
end
