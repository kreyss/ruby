vowels = ["а", "у", "о", "ы", "и", "э", "я", "ю", "ё", "е"]
vowel_hash = {}

("а".."я").each.with_index(1) do |later, index| vowel_hash[later] = index if vowels.include?(later)
end
 print "#{vowel_hash}"
