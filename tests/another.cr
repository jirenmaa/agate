class Test
    @db : Nil

    def show
        if (@db.nil?)
            puts "nil"
        else
            puts "not nil"
        end
    end
end


tst = Test.new
puts tst.show

