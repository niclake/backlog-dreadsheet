return if System.exists?

[
  ['PC','PC', true],
  ['PC - Steam','Steam', true],
  ['PC - Uplay','Uplay', true],
  ['PC - EA/Origin','EA/Origin', true],
  ['PC - Xbox Game Pass','XGP', true],
  ['PC - Epic Game Store','Epic', true],
  ['PC - Twitch','Twitch', true],
  ['PC - Itch.io','Itch.io', true],
  ['Nintendo Switch','Switch', true],
  ['Nintendo 3DS','3DS', true],
  ['Nintendo DS','DS', true],
  ['Nintendo Game Boy Advance','GBA', true],
  ['Nintendo Game Boy Color','GBC', true],
  ['Sony PlayStation 4','PS4', true],
  ['Sony PlayStation 5','PS5', false]
].each do |system_name, nickname, active|
  System.find_or_create_by!(
    system: system_name,
    nickname: nickname,
    active: active
  )
end

puts 'Systems seeded'
