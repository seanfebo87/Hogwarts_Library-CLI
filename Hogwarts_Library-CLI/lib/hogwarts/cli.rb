class Hogwarts::CLI

def start
    puts "Welcome to Hogwarts!"
    puts ""
    puts "1. TextBooks"
    puts "2. Atlas of Hogwarts"
    @@textbooks = create_books_array
    @@atlas = create_atlas_array
end

def create_books_array
    textbooks_array = Hogwarts::Textbooks.scrape_textbooks
    textbooks_array.map do |book|
      Hogwarts::Textbooks.new(book[:name], book[:url])
def create_atlas_array
    atlas_array = Hogwarts::Atlas.scrape_atlas
    atlas_array.map do |n|
      Hogwarts::Atlas.new(n[:name], n[:url])
    end
end

end
