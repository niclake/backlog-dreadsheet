puts 'Games seed'

require 'csv'

return if Game.exists?

CSV.foreach(File.join(File.dirname(__FILE__), 'games.csv'), headers: true) do |row|
  Game.create!(
    title: row['Game Title'],
    series: row['Series'],
    order: (row['Order'].to_f if row['Order']),
    system:
      if row['System'] == 'PC' && row['Service']
        System.find_by(nickname: row['Service'])
      elsif row['System'] == 'PC'
        System.find_by(system: 'PC')
      else
        System.find_by(nickname: row['System'])
      end,
    status:
      case row['Status']
      when 'Priority'
        0
      when 'In Progress'
        1
      when 'Complete'
        2
      when 'Abandoned'
        3
      else
        nil
      end,
    owned: row['Owned'] == 'X', # If X, true
    hour_estimate: row['Hr Est'].to_f
  )

  if row['Hr Comp'] && row['Comp Date']
    GameLog.create!(
      game_id: Game.last.id,
      date: Date.strptime(row['Comp Date'], '%m/%d/%y'),
      hours: row['Hr Comp'].to_f
    )
  end
end

puts 'Games seeded'
