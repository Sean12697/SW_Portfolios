class LetterHistogram
    def initialize(text = "Hello World!")
        @text = text
    end

    def text
        @text
    end

    def text=(text)
        @text = text
    end

    def calculateFrequencies
        chars = {}
        (65..90).map { |a| chars[a.chr] = 0 } # Going through every asc-ii value for A-Z and turning them to their chars as keys in a hashmap, with an inital value of 0
        @text.upcase.gsub(/[^A-Z]/, "").split('').each do | char | # turning/getting only A-Z then making an array of each character to loop over
            chars[char] += 1
        end
        chars;
    end

    def display
        chars = calculateFrequencies # Storing to not call every loop
        chars.each do |key, value|
            stars = (1..value).map { |a| a = '*'} # stars will be an array of '*' chars for every time a char exists
            puts "#{key}:#{stars.join('')}" # stars.join('') will turn ['*', '*'] to just "**"
        end
    end

    private :calculateFrequencies
end

# h = LetterHistogram.new
# h.text
# h.text = "What's it going to be then, eh? What's it going to be then, eh?"
# # h.calculateFrequencie
# h.display

p = LetterHistogram.new("Far out in the uncharted backwaters of the unfashionable end of the Western Spiral arm of the Galaxy lies a small unregarded yellow sun.");
puts p.display;