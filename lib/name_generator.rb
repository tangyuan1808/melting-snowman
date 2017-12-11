MAXTRY = 5


def enter_a_character(remains_try, word, arr)
  puts "you have "+ (remains_try.to_s) +" opportunities"
  print "please enter a character between a to z:"
  character = gets.strip


  if character.length > 1 || character.class != String || character <'a' || character >'z'
    system("clear")
    print_image("../dead.txt")
    exit
  end

  if word.include?(character)
    idx = word.index(character)
    arr[idx] = character
    word[idx] = '*'
    return true
  end

  return false
end

#start the game
def start_game(input, mistake_try)
  system("clear")
  puts "Start the game"
  print "current: "
  input.each{|i| print i}
  puts ""
  puts "mistakes: "+ (mistake_try.to_s)
  puts ""
  puts "Warning, please check your body"
  print_snow_man(mistake_try)
end


def print_snow_man(mistake_try)
  file_name = "../snowman_image"+(mistake_try.to_s)+".txt"
  File.open(file_name).each do |line|
    puts line
  end
end

def print_image(path)
  File.open(path).each do |line|
    puts line
  end
end

def game
  #get the name
  puts "Enter a word"
  word = gets.strip
  length = word.length
  input = Array.new(length, "_")
  current_try = 0
  mistake_try = 0


  while(current_try<MAXTRY &&  input.include?("_")) do
    start_game(input, mistake_try)
    if enter_a_character(MAXTRY-current_try, word, input) == false
      mistake_try+=1
    end
    current_try+=1
  end

  if input.include?("_")
    system("clear")
    print_image("../dead.txt")
  else
    system("clear")
    print_image("../reborn.txt")
  end

  puts ""
  puts ""
  puts ""
  puts ""
  puts "do you want play again? please enter y/n"
  ans = gets.strip
  if ans == 'y'
    system("clear")
    game
  else
    exit
  end
end

game()

