require "http"

apikey = ''
# word_input = ""

while true
  puts "Want to know the definiton of your word?"
  puts "type \"exit now\" to exit"
  word_input = gets.chomp
  if  word_input != "exit now"
    defrequest = HTTP.get("https://api.wordnik.com/v4/word.json/#{word_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{apikey}")
    pronouncerequest = HTTP.get("https://api.wordnik.com/v4/word.json/#{word_input}/pronunciations?useCanonical=false&limit=50&api_key=#{apikey}")
    
    definition = defrequest.parse[0]["text"]
    word = defrequest.parse[0]["word"]
    pronounce = pronouncerequest.parse[0]["raw"]
    
    p "The definition of #{word} is: #{definition}"
    p "#{word} is pronounced: #{pronounce}"
  else
    break
  end
  puts ""
end

# [0]["text"]
