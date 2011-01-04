require 'zlib'
require 'base64'

module Rougher
  class Rougher
    DELIM = "__DST"
    class << self
      def rough_it infilename, outfilename, key=nil
        infile = File.open( infilename, 'r' )
        outfile = File.open( outfilename, 'w' )
        source = infile.read
        outfile.puts( "require File.expand_path('../lib/rougher', __FILE__)" )
        outfile.puts( "text = <<-#{DELIM}" )
        crypt = Crypt.new( key )
        dst = Zlib::Deflate.deflate(source, Zlib::BEST_COMPRESSION)
        dst = Base64.encode64(crypt.encrypt(dst))
        outfile.write( dst )
        outfile.write( "#{DELIM}\neval Rougher::Rougher.smooth_it(text)" )
      end

      def smooth_it text, key=nil
        dst = Base64.decode64(text)
        crypt = Crypt.new(key)
        dst = crypt.decrypt(dst)
        Zlib::Inflate.inflate(dst)
      end
    end
  end
  
  class Crypt
    def initialize( key=nil )
      @key = key
    end
    
    def encrypt str
      str.tr('a-zA-Z', 'n-za-mN-ZA-M')
    end
    
    def decrypt str
      str.tr('a-zA-Z', 'n-za-mN-ZA-M')
    end
  end
end

if $0 == __FILE__
  crypt = Rougher::Crypt.new
  puts crypt.decrypt(crypt.encrypt("test"))
end