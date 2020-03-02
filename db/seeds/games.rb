puts 'Games seed'

require 'csv'

return if Game.exists?

CSV.foreach(File.join(File.dirname(__FILE__), 'games.csv'), headers: true) do |row|
  Game.create!(
    title: row['Game Title'],
    series: row['Series'],
    sort: row['Sort'],
    system: System.find_by(system: row['System']),
    service: row['Service'],
    status: Status.find_by(name: row['Status']),
    owned: row['Owned'] == 'X', # If X, true
    hr_est: row['Hr Est'],
    hr_comp: row['Hr Comp'],
    date_comp: (Date.strptime(row['Date Comp'], '%m/%d/%y') if row['Date Comp'])
  )
end

puts 'Games seeded'
