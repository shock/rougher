module Hello
  class Hello
    class << self
      @@hello = "Hello, world!"
      def hello
        puts @@hello
      end
    end
    def initialize
      Hello.hello
    end
  end
end

Hello::Hello.new