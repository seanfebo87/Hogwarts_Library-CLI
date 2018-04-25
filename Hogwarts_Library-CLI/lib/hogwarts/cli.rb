class Hogwarts::CLI

def start
    puts "Welcome to Hogwarts!"
    puts ""
    puts "1. TextBooks"
    puts "2. Atlas of Hogwarts"
    @@textbooks = create_books_array
    @@atlas = create_atlas_array
end




end
