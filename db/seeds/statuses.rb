return if Status.exists?

[
  'Priority',
  'In Progress',
  'Complete',
  'Not Released',
  'Need To Buy',
  'Abandoned'
].each do |status|
  Status.find_or_create_by!(
    key: status.parameterize(separator: '_'),
    name: status
  )
end

puts 'Statuses seeded'
