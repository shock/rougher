require File.expand_path('../lib/rougher', __FILE__)
text = <<-__DST
a9paWVYKgDAMvPcVo3TxAaLQo98QG7EQW7GK4Oslel0CVpho8eZgT0LMXgEj
DyG86MF6i0A8UgbQbRYdHcp1rGP6jVpEc93QhPl6kEyPPTyxWZIz6v8lcZ3d
7cD2onmK9fUXWHO5sirKWpNcjs4bHg85qA==
__DST
eval Rougher::Rougher.smooth_it(text)