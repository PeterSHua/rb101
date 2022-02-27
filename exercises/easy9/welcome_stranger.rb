def greetings(name, details)
  "=> Hello, #{name.join(' ')}! Nice to have a #{details[:title]}"\
  " #{details[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
