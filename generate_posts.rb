#!/usr/bin/env ruby

to_generate = []
industries = []

File.readlines('ccb-scg.csv').each do |l|
  entry = {}
  month = rand(12)+1
  day = rand(28)+1
  if month < 2
    year = 2013
  else
    year = 2012
  end
  
  if l.split(';')[1] == nil
    next
  end
  lowercase_industry = l.split(';')[1].downcase.gsub('"', '').gsub(' ', '-').gsub('(', '').gsub(')', '')
  entry['filename'] = "#{year}-#{month}-#{day}-#{lowercase_industry}-cold-calling-scripts.md"
  entry['industry'] = l.split(';')[1].gsub('"', '')
  industries.push(entry['industry'])
  entry['tags'] = 'places' #l.split(';')[2].downcase.gsub('"', '')
  entry['unique_graph'] = l.split(';')[3].gsub('"', '')
  to_generate.push(entry)
end

to_generate.each do |entry|
  filename = "locations/#{entry['filename']}"
  puts "Generating #{filename}"
  f = File.open(filename, 'w')
  template = File.open("template.txt", 'r').read()
  text = template.gsub('@tags', entry['tags'])
  text = text.gsub('@unique_graph', entry['unique_graph'])
  text = text.gsub('@industry', entry['industry'])
  f.write(text)
end

puts industries.count, industries.uniq.count
inds = {}
industries.each {|i| inds[i] = 0 }
industries.each {|i| inds[i] += 1 }
puts inds.collect {|k,v| v > 1? k : nil}.compact
