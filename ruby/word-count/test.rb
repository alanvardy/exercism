item = "'something'"

if item =~ /'\w+'/
  puts 'match!'
  item = /'(\w+)'/.match(item)[1]
end

puts item
