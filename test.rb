require File.expand_path('../lib/rougher', __FILE__)

infilename = File.expand_path('../smooth.rb', __FILE__)
outfilename = File.expand_path('../rough.rb', __FILE__)

Rougher::Rougher.rough_it( infilename, outfilename )