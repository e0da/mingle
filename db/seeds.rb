['Full time', 'Part time', 'Intern during school', 'Internet out of school'].each do |type|
  Availability.create(description: type)
end
