anthem_file = File.readlines("_knowledge/associations/anthem.txt")
anthem_row         = File.read("_ai/input/ai_choice.txt").strip.to_i

# If anthem row is greater than 13, then reset to zero.
if anthem_row > 12
  anthem_row = 0
end

anthem_association = anthem_file[anthem_row].strip

open("interpret_anthem.pl", "w") { |f|
  f.puts ":- initialization anthem, halt.

anthem :-
    consult('_knowledge/anthem.pl'), 
    X = #{anthem_association}, write(X). % consults the stories prolog file."
}

open("_ai/input/ai_choice.txt", "w") { |f|
  anthem_row = anthem_row + 1

  f.puts anthem_row
}
