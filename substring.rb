# Idea: Iterate through array. For each element check if substring of entry string.
# If so, if the return hash alr contaisn add one, otherwise add new element and set to 1.

def substrings(word, dictionary)
  hash = {}
  word_array = word.downcase.split
  dictionary.each do |str|
    word_array.each do |index|
      if index.include?(str)
         if hash.has_key?(str) 
        hash[str] += 1
        else
        hash[str] = 1
        end
      end
    end
  end
  hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]   => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

print substrings("below", dictionary)
print substrings("Howdy partner, sit down! How's it going?", dictionary)