['Full time', 'Part time', 'Intern'].each do |desc|
  Availability.find_or_initialize_by_description(desc).save
end
