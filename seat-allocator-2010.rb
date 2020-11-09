# This hash holds the 2010 census populations of the fifty states, plus DC and
# Puerto Rico. This data is the default.
statepops = {
  "Alabama" => 4_802_982,  "Alaska" => 721_523, "Arizona" => 6_412_700,
  "Arkansas" => 2_926_229, "California" => 37_341_989, "Colorado" => 5_044_930,
  "Connecticut" => 3_581_628, "Delaware" => 900_877,
  "District of Columbia" => 601_723, "Florida" => 18_900_773,
  "Georgia" => 9_727_566, "Hawaii" => 1_366_862, "Idaho" => 1_573_499,
  "Illinois" => 12_865_380, "Indiana" => 6_501_582, "Iowa" => 3_053_787,
  "Kansas" => 2863813, "Kentucky" => 4_350_606, "Louisiana" => 4_553_962,
  "Maine" => 1_333_074, "Maryland" => 5_789_929, "Massachusetts" => 6_559_644,
  "Michigan" => 9_911_626, "Minnesota" => 5_314_879, "Mississippi" => 2_978_240,
  "Missouri" => 6_011_478, "Montana" => 994_416, "Nebraska" => 1_831_825,
  "Nevada" => 2_709_432, "New Hampshire" => 1_321_445,
  "New Jersey" => 8_807_501, "New Mexico" => 2_067_273,
  "New York" => 19_421_055, "North Carolina" => 9_565_781,
  "North Dakota" => 675_905, "Ohio" => 11_568_495, "Oklahoma" => 3_764_882,
  "Oregon" => 3_848_606, "Pennsylvania" => 12_734_905,
  "Puerto Rico" => 3_725_789, "Rhode Island" => 1_055_247,
  "South Carolina" => 4_645_975, "South Dakota" => 819_761,
  "Tennessee" => 6_375_431, "Texas" => 25_268_418, "Utah" => 2_770_765,
  "Vermont" => 630_337, "Virginia" => 8_037_736, "Washington" => 6_753_369,
  "West Virginia" => 1_859_815, "Wisconsin" => 5_698_230, "Wyoming" => 568_300
}


# According to legislation and the Constitution, all states start with 1 seat,
# and then the other seats are allocated.
currentseats = {
  "Alabama" => 1,  "Alaska" => 1, "Arizona" => 1, "Arkansas" => 1,
  "California" => 1, "Colorado" => 1, "Connecticut" => 1, "Delaware" => 1,
  "District of Columbia" => 1, "Florida" => 1, "Georgia" => 1, "Hawaii" => 1,
  "Idaho" => 1, "Illinois" => 1, "Indiana" => 1, "Iowa" => 1, "Kansas" => 1,
  "Kentucky" => 1, "Louisiana" => 1, "Maine" => 1, "Maryland" => 1,
  "Massachusetts" => 1, "Michigan" => 1, "Minnesota" => 1, "Mississippi" => 1,
  "Missouri" => 1, "Montana" => 1, "Nebraska" => 1, "Nevada" => 1,
  "New Hampshire" => 1, "New Jersey" => 1, "New Mexico" => 1, "New York" => 1,
  "North Carolina" => 1, "North Dakota" => 1, "Ohio" => 1, "Oklahoma" => 1,
  "Oregon" => 1, "Pennsylvania" => 1, "Puerto Rico" => 1, "Rhode Island" => 1,
  "South Carolina" => 1, "South Dakota" => 1, "Tennessee" => 1, "Texas" => 1,
  "Utah" => 1, "Vermont" => 1, "Virginia" => 1, "Washington" => 1,
  "West Virginia" => 1, "Wisconsin" => 1, "Wyoming" => 1
}

# This is dummy data that is replaced by the calculations in the code.
stateprioritynumber = {
  "Alabama" => 1,  "Alaska" => 1, "Arizona" => 1, "Arkansas" => 1,
  "California" => 1, "Colorado" => 1, "Connecticut" => 1, "Delaware" => 1,
  "District of Columbia" => 1, "Florida" => 1, "Georgia" => 1, "Hawaii" => 1,
  "Idaho" => 1, "Illinois" => 1, "Indiana" => 1, "Iowa" => 1, "Kansas" => 1,
  "Kentucky" => 1, "Louisiana" => 1, "Maine" => 1, "Maryland" => 1,
  "Massachusetts" => 1, "Michigan" => 1, "Minnesota" => 1, "Mississippi" => 1,
  "Missouri" => 1, "Montana" => 1, "Nebraska" => 1, "Nevada" => 1,
  "New Hampshire" => 1, "New Jersey" => 1, "New Mexico" => 1, "New York" => 1,
  "North Carolina" => 1, "North Dakota" => 1, "Ohio" => 1, "Oklahoma" => 1,
  "Oregon" => 1, "Pennsylvania" => 1, "Puerto Rico" => 1, "Rhode Island" => 1,
  "South Carolina" => 1, "South Dakota" => 1, "Tennessee" => 1, "Texas" => 1,
  "Utah" => 1, "Vermont" => 1, "Virginia" => 1, "Washington" => 1,
  "West Virginia" => 1, "Wisconsin" => 1, "Wyoming" => 1
}

# Some basic functions.
def die(x)
  puts x
  exit(1)
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
    population = 308_745_538
  elsif populationquery.downcase == "n"
    puts "\nPlease enter the total US population you wish to use."
    prompt
    population = $stdin.gets.chomp.to_f

# Iterates through the list of states, and overwrites the default 2010 census
# population with user input.
    statepops.each_key do |name|
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

# A query of whether the user wants to use a specific number of seats or use a
# specific representativeness of each seat
puts "Do you want to (1) enter a specific number of seats OR (2) enter the",
  "number of people the average representative represents, 1 or 2?"
prompt
seatsquery = $stdin.gets.chomp.to_i

  if seatsquery == 1
    puts %q{
      How many seats do you want the House to have?
        Some interesting numbers:
        435 (the current fixed number of seats by law)
        548 (the "Wyoming Rule")
        1_625 (Madisonian)
        10_292 (Constitutional maximum)
    }
    prompt
    seats = $stdin.gets.chomp.to_f.ceil

    repratio = (population / seats).round(0)

    puts "\nThe US House of Representatives will have a total of #{seats}",
      "seats, with the average Representative representing #{repratio} people."
    puts
  elsif seatsquery == 2
    puts %q{
      How many people does the average representative represent?
        Some interesting numbers:
        709_760 (the current average for 435 seats)
        563_626 (the "Wyoming rule")
        190_000 (Madisonian)
        30_000 (Constitutional minimum)
    }
    prompt
    repratio = $stdin.gets.chomp.to_f

    # Calculating the number of seats.
    seats = (population / repratio).round(0)
    puts "\nThe US House of Representatives will have a total of #{seats}",
      "seats, with the average Representative representing #{repratio} people."
    puts
  else
    die("\nERROR 1: I'm sorry, that answer wasn't valid. Goodbye!\n")
  end

seatstogiveout = seats - 52
while seatstogiveout > 0

# Takes each state and calculates a priority number for them, then orders them
# from largest priority number to smallest.
  statepops.each do |k, v|
    stateprioritynumber[k] = statepops[k] / Math.sqrt(currentseats[k] * (currentseats[k] + 1))
    stateprioritynumber = stateprioritynumber.invert.sort { |a, b| b <=> a }.to_h.invert
  end

# Takes the state name from the first position in the sorted priority number
# hash and assigns one seat to that state.
  key = stateprioritynumber.keys[0]
  currentseats[key] += 1

# This shows each step of the process as individual seats are assigned.
# Feel free to comment this out if you want less text displayed when you run
# the program.
# puts "#{key} now has #{currentseats[key]} seats."

  seatstogiveout -= 1
end

puts "\nThe final allocation of seats to states is:\n\n"

currentseats.each do |k, v|
  puts "#{k}: #{v} seats."
end

puts "\nThank you for using \"Seat Allocator 2010\".\n"
