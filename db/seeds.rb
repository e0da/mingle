['Full time', 'Part time', 'Intern during school', 'Intern during summer'].each do |desc|
  Availability.find_or_initialize_by_description(desc).save
end
