class Generator
  def generate_word
    words = File.readlines('google-10000-english-no-swears.txt').map(&:chomp)
    filter = words.select { |word| word.length.between?(5, 12) }
    filter.sample
  end
end
