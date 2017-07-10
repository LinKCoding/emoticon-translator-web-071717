require "yaml"

def load_library(file)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  raw = YAML.load_file(file)
  raw.each do |mean, emo|
    library["get_meaning"][emo[1]] = mean
    library["get_emoticon"][emo[0]] = emo[1]
  end
  library
end

def get_japanese_emoticon(file, moti)
  library = load_library(file)
  library["get_emoticon"].each do |yank, jap|
    return jap if moti == yank
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoji)
  library = load_library(file)
  library["get_meaning"].each do |jap, mean|
    return mean if emoji == jap
  end
  return "Sorry, that emoticon was not found"
end
