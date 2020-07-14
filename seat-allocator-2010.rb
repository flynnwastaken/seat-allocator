# This hash holds the 2010 census populations of the fifty states, plus DC and Puerto Rico.
# This data is the default.
statepops = {
  "Alabama" => 4802982,  "Alaska" => 721523, "Arizona" => 6412700, "Arkansas" => 2926229,
  "California" => 37341989, "Colorado" => 5044930, "Connecticut" => 3581628, "Delaware" => 900877,
  "District of Columbia" => 601723, "Florida" => 18900773, "Georgia" => 9727566,
  "Hawaii" => 1366862, "Idaho" => 1573499, "Illinois" => 12865380, "Indiana" => 6501582,
  "Iowa" => 3053787, "Kansas" => 2863813, "Kentucky" => 4350606, "Louisiana" => 4553962,
  "Maine" => 1333074, "Maryland" => 5789929, "Massachusetts" => 6559644, "Michigan" => 9911626,
  "Minnesota" => 5314879, "Mississippi" => 2978240, "Missouri" => 6011478, "Montana" => 994416,
  "Nebraska" => 1831825, "Nevada" => 2709432, "New Hampshire" => 1321445, "New Jersey" => 8807501,
  "New Mexico" => 2067273, "New York" => 19421055, "North Carolina" => 9565781,
  "North Dakota" => 675905, "Ohio" => 11568495, "Oklahoma" => 3764882, "Oregon" => 3848606,
  "Pennsylvania" => 12734905, "Puerto Rico" => 3725789, "Rhode Island" => 1055247,
  "South Carolina" => 4645975, "South Dakota" => 819761, "Tennessee" => 6375431,
  "Texas" => 25268418, "Utah" => 2770765, "Vermont" => 630337, "Virginia" => 8037736,
  "Washington" => 6753369, "West Virginia" => 1859815, "Wisconsin" => 5698230, "Wyoming" => 568300
}

# According to legislation and the Constitution, all states start with 1 seat, and then the other seats are allocated.
currentseats = {
  "Alabama" => 1,  "Alaska" => 1, "Arizona" => 1, "Arkansas" => 1, "California" => 1,
  "Colorado" => 1, "Connecticut" => 1, "Delaware" => 1, "District of Columbia" => 1,
  "Florida" => 1, "Georgia" => 1, "Hawaii" => 1, "Idaho" => 1, "Illinois" => 1,
  "Indiana" => 1, "Iowa" => 1, "Kansas" => 1, "Kentucky" => 1, "Louisiana" => 1,
  "Maine" => 1, "Maryland" => 1, "Massachusetts" => 1, "Michigan" => 1, "Minnesota" => 1,
  "Mississippi" => 1, "Missouri" => 1, "Montana" => 1, "Nebraska" => 1, "Nevada" => 1,
  "New Hampshire" => 1, "New Jersey" => 1, "New Mexico" => 1, "New York" => 1, "North Carolina" => 1,
  "North Dakota" => 1, "Ohio" => 1, "Oklahoma" => 1, "Oregon" => 1, "Pennsylvania" => 1,
  "Puerto Rico" => 1, "Rhode Island" => 1, "South Carolina" => 1, "South Dakota" => 1,
  "Tennessee" => 1, "Texas" => 1, "Utah" => 1, "Vermont" => 1, "Virginia" => 1,
  "Washington" => 1, "West Virginia" => 1, "Wisconsin" => 1, "Wyoming" => 1
}

# This is dummy data that is replaced by the calculations in the code.
stateprioritynumber = {
  "Alabama" => 1,  "Alaska" => 1, "Arizona" => 1, "Arkansas" => 1, "California" => 1,
  "Colorado" => 1, "Connecticut" => 1, "Delaware" => 1, "District of Columbia" => 1,
  "Florida" => 1, "Georgia" => 1, "Hawaii" => 1, "Idaho" => 1, "Illinois" => 1,
  "Indiana" => 1, "Iowa" => 1, "Kansas" => 1, "Kentucky" => 1, "Louisiana" => 1,
  "Maine" => 1, "Maryland" => 1, "Massachusetts" => 1, "Michigan" => 1, "Minnesota" => 1,
  "Mississippi" => 1, "Missouri" => 1, "Montana" => 1, "Nebraska" => 1, "Nevada" => 1,
  "New Hampshire" => 1, "New Jersey" => 1, "New Mexico" => 1, "New York" => 1, "North Carolina" => 1,
  "North Dakota" => 1, "Ohio" => 1, "Oklahoma" => 1, "Oregon" => 1, "Pennsylvania" => 1,
  "Puerto Rico" => 1, "Rhode Island" => 1, "South Carolina" => 1, "South Dakota" => 1,
  "Tennessee" => 1, "Texas" => 1, "Utah" => 1, "Vermont" => 1, "Virginia" => 1,
  "Washington" => 1, "West Virginia" => 1, "Wisconsin" => 1, "Wyoming" => 1
}

# Some basic functions.
def die(x)
  puts x
  exit(0)
end

def prompt
  print ">> "
end

# Querying the user for their preference
puts %q{
  The population of the USA at the last census in 2010 was 308,745,538.
  Do you wish to use this population and the 2010 state populations for House
  of Representatives seat allocation, Y/N?
}
prompt
populationquery = $stdin.gets.chomp

  if populationquery.downcase == "y"
    population = 308745538
  elsif populationquery.downcase == "n"
    puts "\nPlease enter the total US population you wish to use."
    prompt
    population = $stdin.gets.chomp.to_f

# Iterates through the list of states, and overwrites the default 2010 census population with user input.
    statepops.each do |name, number|
      puts "\nPlease enter the population of #{name} you wish to use."
      prompt
      newstatepop = $stdin.gets.chomp.to_i
      statepops[name] = newstatepop
      puts "\nOkay, the population of #{name} is now #{newstatepop}."
    end

# User must manually confirm their data entry was correct.
    puts "\nCheck if all these numbers are correct:\n\n"
    puts statepops
    puts "\nAre they correct, Y/N?"
    prompt
    doublecheck = $stdin.gets.chomp
      if doublecheck.downcase == "y"
        puts "\nGreat!"
      elsif doublecheck.downcase == "n"
        puts "\nShoot."
        die("\nI guess you'll have to start over.\n")
      else
        die("\nERROR 2: Sorry, what?? Start over.")
      end
  else
    die("\nERROR 1: I'm sorry, that answer wasn't valid. Goodbye!\n")
  end

# A very important query for the user.
puts "\nHow many people does each representative represent?"
prompt
repratio = $stdin.gets.chomp.to_f

# Calculating the number of seats.
seats = (population / repratio).round(0)
puts "\nThe US House of Representatives will have a total of #{seats} seats.\n"

seatstogiveout = seats - 52
while seatstogiveout > 0

# Takes each state and calculates a priority number for them, then orders them from largest priority number to smallest.
  statepops.each do |k, v|
    stateprioritynumber[k] = statepops[k] / Math.sqrt(currentseats[k] * (currentseats[k] + 1))
    stateprioritynumber = stateprioritynumber.invert.sort { |a, b| b <=> a }.to_h.invert
  end

# Takes the state name from the first position in the sorted priority number hash and assigns one seat to that state.
  key = stateprioritynumber.keys[0]
  currentseats[key] += 1

# This shows each step of the process as individual seats are assigned.
# Feel free to comment this out if you want less text displayed when you run the program.
#  puts "#{key} now has #{currentseats[key]} seats."

  seatstogiveout -= 1
end

puts "\nThe final allocation of seats to states is:\n\n"

currentseats.each do |k, v|
  puts "#{k}: #{v} seats."
end

puts "\nThank you for using \"Seat Allocator 2010\".\n"
