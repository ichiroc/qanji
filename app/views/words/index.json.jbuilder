json.status @status
json.words @words do |word|
  json.id word.id
  json.text word.text
  json.english word.english
  json.score word.score
  json.category word.category
  json.coordinates word.coordinates do |coordinate|
    json.x coordinate.x
    json.y coordinate.y
  end
end
