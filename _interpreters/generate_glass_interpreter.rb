glass_file = File.readlines("_knowledge/associations/fromglasstograss.txt")
glass_row  = File.read("_ai/input/ai_choice.txt").strip.to_i

# If anthem row is greater than 13, then reset to zero.
if glass_row > 
  glass_row = 0
end

glass_association = glass_file[glass_row].strip

open("interpret_glass.pl", "w") { |f|
  f.puts ":- initialization glass, halt.

glass :-
    consult('_knowledge/fromglasstograss.pl'), 
    X = #{glass_association}, write(X). % consults the stories prolog file."
}

open("_ai/input/ai_choice.txt", "w") { |f|
  glass_row = glass_row + 1

  f.puts glass_row
}
