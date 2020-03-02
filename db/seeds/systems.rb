return if System.exists?

[
  'Switch',
  'PS4',
  'PC',
  '3DS',
  'PS5',
  'DS',
  'DS Emulator',
  'GBA/3DS',
  'GBC'
].each do |system_name|
  System.find_or_create_by!(
    system: system_name
  )
end
