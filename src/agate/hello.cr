class Hello
    property time : String
    property greet : String

    def initialize
        @time = "morning"
        @greet = "Good Morning"
    end

    def time(time)
        @time = time
    end

    def greet(greet)
        @greet = greet
    end

end
