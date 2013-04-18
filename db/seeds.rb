[
  'Full time',
  'Intern',
  'Part time',
].each do |description|
  Availability.find_or_initialize_by_description(description).save
end

[
  'Data Center Systems Administrator',
  'Graphic Designer',
  'Project Management',
  'Sales/Account Management',
  'Social Media and Marketing Coordinator',
  'Software Developer',
  'Technical Support and QA',
].each do |description|
  Position.find_or_initialize_by_description(description).save
end
