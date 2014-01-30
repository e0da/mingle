[
  'Full time',
  'Intern',
  'Part time',
].each do |description|
  Availability.find_or_initialize_by_description(description).save
end

[
  'Software Developer',
  'DevOps / Systems Administrator',
  'Technical Support and QA',
  'Sales / Account Management',
  'Project Management',
  'Graphic Designer',
  'Social Media and Marketing Coordinator',
].each do |description|
  Position.find_or_initialize_by_description(description).save
end
