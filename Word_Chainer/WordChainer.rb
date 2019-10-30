require "byebug"
class WordChainer
dictionary_file_name = File.open("dictionary.txt")
    def initialize(dictionary_file_name)
        @dictionary = dictionary_file_name.readlines.map(&:chomp).to_set
    end

    def adjacent_words(word)
        set_words = []

        @dictionary.each do |same_length_word|
            if same_length_word.length == word.length
                count = 0
                (0...word.length).each do |n|
                    if word[n] != same_length_word[n]
                        count += 1
                    end
                end
            if count == 1
                set_words << same_length_word
            end
            end
        end
        set_words
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = { source => nil }
        until @current_words.empty?
            new_current_words = []
            @current_words.each do |current_word|
                adjacent_words = adjacent_words(current_word)
                adjacent_words.each do |adjacent_word|
                    if @all_seen_words.include?(adjacent_word)
                    else
                    new_current_words << adjacent_word
                    @all_seen_words = {adjacent_word => current_word}
                    end
                end
            end
            new_current_words.each do |word|
               puts @all_seen_words.key(word)
            end
            @current_words = new_current_words
        end
    end

    def explore_current_words(current_word)

        
    end
end



