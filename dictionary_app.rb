require "http"

apikey = ''
p "Want to know the definiton of your word?"

word_input = gets.chomp

defrequest = HTTP.get("https://api.wordnik.com/v4/word.json/#{word_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{apikey}")

definition = defrequest.parse[0]["text"]
word = defrequest.parse[0]["word"]

p "The definition of #{word} is: #{definition}"


# [0]["text"]
