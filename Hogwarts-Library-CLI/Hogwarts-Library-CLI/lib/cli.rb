class Hogwarts::CLI

def start
    puts ""
    puts "----------Welcome to the Hogwarts Library!----------"
    puts ""
    puts "1. TextBooks"
    puts "2. Atlas of Hogwarts"
    @@textbooks = create_books_array
    @@atlas = create_atlas_array
    menu
end

def create_books_array
    textbooks_array = Hogwarts::Textbooks.scrape_textbooks
    textbooks_array.map do |book|
      Hogwarts::Textbooks.new(book[:name], book[:url])
    end
end

def create_atlas_array
    atlas_array = Hogwarts::Atlas.scrape_atlas
    atlas_array.map do |n|
      Hogwarts::Atlas.new(n[:name], n[:url])
    end
end

def menu
    input = nil
    puts ""
    puts "Enter the number of the category you would like a list of or 'exit to leave program."
    while input != "exit"
    input = gets.strip
      case input
      when "1"
        textbooks(@@textbooks)
      when "2"
        atlas(@@atlas)
      when "exit"
        goodbye
      else
        puts "Please try again"
      end
  end
end

def textbooks(books)
    puts ""
    Hogwarts::Textbooks.all.each.with_index(1) do |title, i|
      puts "#{i}. #{title.name}"
    end
    puts ""
    puts "Please select a book number for link to more info or type 'exit' to leave program."
    menu_textbook
end

def menu_textbook
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= 35
      link = Hogwarts::Textbooks.all[input.to_i-1]
      puts ""
      puts "#{link.url}"
      puts ""
      puts "Choose another number or type 'list' to see books again or 'main to get back to main menu or 'exit' to leave program."
        elsif input == "main"
          start
      elsif input == "exit"
        goodbye
      elsif input == "list"
          puts ""
        @@textbooks.each.with_index(1) do |title, i|
      puts "#{i}. #{title.name}"
    end
      else
          puts "Please try again!"
    end
    end
end

def atlas(atlas)
    puts ""
    @@atlas.each.with_index(1) do |title, i|
      puts "#{i}. #{title.name}"
    end
    puts ""
    puts "Please select a map number for link to more info or type 'exit' to leave program."
    menu_atlas
end


def menu_atlas
    input = nil
    while input != "exit"
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= 35
      link = Hogwarts::Atlas.all[input.to_i-1]
      puts ""
      puts "#{link.url}"
      puts ""
      puts "Choose another number or type 'list' to see atlas again or 'main' to get back to main menu or 'exit' to leave program."
        elsif input == "main"
          start
      elsif input == "exit"
        goodbye
      elsif input == "list"
        puts ""
        @@atlas.each.with_index(1) do |title, i|
      puts "#{i}. #{title.name}"
    end
      else
          puts "Please try again!"
    end
    end
end

def goodbye
  abort("----------Thanks for coming!----------")
end

end
