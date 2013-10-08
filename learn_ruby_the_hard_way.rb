
# ex40
cities = {
    'CA' => 'San Francisco',
    'MI' => 'Detroit',
    'FL' => 'Jacksonville',
}

cities['NY'] = 'New York'
cities['OR'] = 'Portland'

def find_city(map, state)
    if map.include? state
        return map[state]
    else
        return "Not found."
    end
end

cities[:find] = method(:find_city)

while true
    print "State? (ENTER to quit) "
    state = gets.chomp

    break if state.empty?

    puts cities[:find].call(cities, state)
end
__END__

# ex34
def prompt()
    print "> "
end

def gold_room()
    puts "This room is full of gold. How much do you take?"
    prompt; next_move = gets.chomp
    if next_move.include?"0" or next_move.include?"1"
        how_much = next_move.to_i()
    else
        dead("Man, learn to type a number.")
    end

    if how_much < 50
        puts "Nice, You're not greedy, you win!"
        Process.exit(0)
    else
        dead("You greedy bastard!")
    end
end

def bear_room()
    puts "There is a bear here."
    puts "The bear has a bunch of honey."
    puts "The fat bear is in front of another door."
    puts "How are you going to move the bear?"
    bear_moved = false

    while true
        prompt; next_move = gets.chomp

        if next_move == "take honey"
            dead("The bear looks at you then slaps your face off.")
        elsif next_move == "taunt bear" and not bear_moved
            puts "The bear has moved from the door. You can go through it now."
            bear_moved = true
        elsif next_move == "taunt bear" and bear_moved
            dead("The bear gets pissed off and chews your leg off.")
        elsif next_move == "open door" and bear_moved
            gold_room()
        else
            puts "I got no idea what that means."
        end
    end
end

def cthulu_room()
    puts "Here you see the great evil Cthulu."
    puts "He, it, whatever stares at you and you go insane."
    puts "Do you flee for your life or eat your head?"

    prompt; next_move = gets.chomp

    if next_move.include? "flee"
        start()
    elsif next_move.include? "head"
        dead("Well that was tasty!")
    else
        cthulu_room()
    end
end

def dead(why)
    puts "#{why} Good job!"
    Process.exit(0)
end

def start()
    puts "You are in a dark room."
    puts "There is a door to your right and left."
    puts "Which one do you take?"

    prompt; next_move = gets.chomp

    if next_move == "left"
        bear_room()
    elsif next_move == "right"
        cthulu_room()
    else
        dead("You stumble around the room until you starve.")
    end
end

start()

# ex33
i = 0
numbers = []

while i < 6
    puts "At the top i is #{i}"
    numbers.push(i)

    i = i + 1
    puts "Numbers now: #{numbers}"
    puts "At he bottom i is #{i}"
end

puts "The numbers: "
for num in numbers
    puts num
end


# ex32
hairs = 'brown', 'blond', 'red'
#puts hairs
for hair in hairs
    puts "#{hair}"
end

hairs.each do |hair|
    puts "A hair of type: #{hair}"
end

elements = []
for i in (0..5)
    puts "Adding #{i} to the list."
    elements.push(i)
end

puts elements

#ex29 ex30
people = 20
cats = 30
dogs = 15

if people < cats
    puts "Too many cats!, The world is doomed!"
elsif cars < people
    puts "We can't decide."
else
    puts "We should not take the cars."
end

if people > cats
    puts "Not many cats! The world is saved!"
end

#ex25
module Ex25
    def self.break_words(stuff)
        words = stuff.split(' ')
        words
    end

    def self.sort_words(words)
        words.sort()
    end

    def self.print_first_word(words)
        word = words.shift()
        puts word
    end

    def self.print_last_word(words)
        word = words.pop()
        puts word
    end

    def self.sort_sentence(sentence)
        words = break_words(sentence)
        sort_words(words)
    end

    def self.print_first_and_last(sentence)
        words = break_words(sentence)
        print_first_word(words)
        print_last_word(words)
    end

    def self.print_first_and_last_sorted(sentence)
        words = sort_sentence(sentence)
        print_first_word(words)
        print_last_word(words)
    end
end

#ex24
puts "Let's practice everything."
puts "You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs."

poem = <<MULTI_LINE_STRING

\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none.

MULTI_LINE_STRING

puts "--------------"
puts poem
puts "--------------"

five = 10 - 2 + 3 - 6
puts "This should be five: #{five}"

def secret_formula(started)
    jelly_beans = started * 500
    jars = jelly_beans / 1000
    crates = jars / 100
    return jelly_beans, jars, crates
end

start_point = 10000
beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: #{start_point}"
puts "We'd have #{beans} beans, #{jars} jars, and #{crates} crates."

start_point = start_point / 10

puts "We can also do that this way:"
puts "We'd have %s beans, %s jars, and %s crates." % secret_formula(start_point)

#ex21
def add(a, b)
    puts "ADDING #{a} + #{b}"
    a + b
end

def divide(a, b)
    puts "DIVIDING #{a} / #{b}"
    a / b
end

age = add(30, 5)
puts age
iq = divide(100, 3)
puts iq

#ex20
input_file = ARGV[0]

def print_all(f)
    puts f.read()
end

def rewind(f)
    f.seek(0, IO::SEEK_SET)
end

def print_a_line(line_count, f)
    puts "#{line_count} #{f.readline()}"
end

current_file = File.open(input_file)
puts "First let's print the whole file:"
puts
print_all(current_file)

puts "Now let's rewind, kind of like a tape."
rewind(current_file)

puts "Let's print the lines:"
current_line = 1
print_a_line(current_line, current_file)

current_line = 2
print_a_line(current_line, current_file)

current_line = 3
print_a_line(current_line, current_file)

#ex19 use different parameters
def cheese_and_crackers(cheese_count, boxes_of_crackers)
    puts "You have #{cheese_count} cheeses!"
    puts "You have #{boxes_of_crackers} boxes of crackers!"
    puts "Man that's enough for a party!"
    puts "Get a blanket."
    puts
end

puts "We can just give the function numbers directly:"
cheese_and_crackers(20, 30)

puts "OR, we can use variables from our script:"
amount_of_cheese = 10
amount_of_crackers = 50
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)

#ex18
def puts_two(*args)
    arg1, arg2 = args
    puts "arg1: #{arg1}, arg2: #{arg2}"
end

def puts_two_again(arg1, arg2)
    puts "arg1: #{arg1}, arg2: #{arg2}"
end

def puts_one(arg1)
    puts "arg1: #{arg1}"
end

def puts_none()
    puts "I got nothing."
end
puts_two("Zed","Shaw")
puts_two_again("Zed","Shaw")
puts_one("First!")
puts_none()

#ex17
#ruby learn_ruby_the_hard_way.rb test.txt copied.txt
from_file, to_file = ARGV
puts "Copying from #{from_file} to #{to_file}"

input = File.open(from_file)
indata = input.read()

puts "The input file is #{indata.length} bytes long"

puts "Does the output file exist? #{File.exists? to_file}"
puts "Ready, hit RETURN to continue, CTRL-C to abort."
STDIN.gets

output = File.open(to_file, 'w')
output.write(indata)

puts "Alright, all done."

output.close()
input.close()


#ex16
filename = ARGV.first
script = $0
puts "We' re going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

print "? "
STDIN.gets

puts "Opening the file..."
target = File.open(filename, 'w')

#target.truncate(target.size()) #something is wrong with this file
puts "Now I'm going to ask you for three lines."

print "line 1: "; line1 = STDIN.gets.chomp()
print "line 2: "; line2 = STDIN.gets.chomp()
print "line 3: "; line3 = STDIN.gets.chomp()

puts "I'm going to write these to the file."
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "and finally, we close it."
target.close()

a = '/home/mgsys/hello/world/hoho/haha'
b = a[/\/.+\//]
if File.directory?(b)
    puts 'yes'
else
    puts 'no'
end

#ex15
filename = ARGV.first

txt = File.open(filename)
puts "Here's you file: #{filename}"
puts txt.read()

puts "Type the filename again:"
file_again = STDIN.gets.chomp()
txt_again = File.open(file_again)
puts txt_again.read()

#ex14
user = ARGV.first

puts "hi #{user}, I'm the #{$0} script."
puts "Do you like me #{user}?"

likes = STDIN.gets.chomp()

puts <<MESSAGE
Alright, so you said #{likes} about liking me.
MESSAGE

#ex13
first, second, third = ARGV
puts "#{$0}"
puts "#{first}"
puts "#{second}"
puts "#{third}"

fourth = gets.chomp()
fifth = gets.chomp()

puts "fourth: #{fourth}"
puts "fifth: #{fifth}"

puts $LOAD_PATH

#ex12
require 'open-uri'

#open("http://www.ruby-lang.org/en") do |f|
#    f.each_line {|line| p line}
#    puts f.base_uri
#    puts f.content_type
#    puts f.charset
#    puts f.content_encoding
#    puts f.last_modified
#end

#ex11
print "How old are you? "
age = gets.chomp().to_i
print "How tall are you? "
height = gets.chomp()

puts "so, you're #{age} old, #{height} tall"
