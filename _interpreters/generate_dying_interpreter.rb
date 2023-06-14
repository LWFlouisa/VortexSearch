dyinginside_file = File.readlines("_knowledge/associations/dyinginside.txt")
dyinginside_row  = File.read("_ai/input/ai_choice.txt").strip.to_i

# If anthem row is greater than 13, then reset to zero.
if dyinginside_row > 5
  dyinginside_row = 0
end

dyinginside_association = dyinginside_file[dyinginside_row].strip

open("interpret_dyinginside.pl", "w") { |f|
  f.puts ":- initialization dyinginside, halt.

dyinginside :-
    consult('_knowledge/dyinginside.pl'), 
    X = #{dyinginside_association}, write(X). % consults the stories prolog file."
}

open("_ai/input/ai_choice.txt", "w") { |f|
  dyinginside_row = dyinginside_row + 1

  f.puts dyinginside_row
}
