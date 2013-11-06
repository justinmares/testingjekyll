#!/usr/env ruby

Dir.chdir('/Users/rgraham/whitetail/scalable_content_generation/ccb/_posts')
puts "Working in #{Dir.pwd()}"
Dir.glob('*.md').each do |f|
  file = File.open(f, 'r')
  lines = file.readlines()
  file.close()
  paragraph = lines[8]
  randomize = lines[13]
  top = lines[11]
  lines[13] = paragraph
  lines[11] = randomize
  lines[8] = top
  puts lines, "\n\n************************\n\n"
  File.open(f, 'w').write(lines.join(""))
end
  