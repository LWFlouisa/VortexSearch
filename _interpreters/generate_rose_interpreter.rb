rose_file = File.readlines("_knowledge/associations/ravenrose.txt")
rose_row  = File.read("_ai/input/ai_choice.txt").strip.to_i

# If anthem row is greater than 13, then reset to zero.
if rose_row > 9
  rose_row = 0
end

rose_association = rose_file[rose_row].strip

open("interpret_rose.pl", "w") { |f|
  f.puts ":- initialization rose, halt.

rose :-
    consult('_knowledge/ravenrose.pl'), 
    X = #{rose_association}, write(X). % consults the stories prolog file."
}

open("_ai/input/ai_choice.txt", "w") { |f|
  rose_row = rose_row + 1

  f.puts rose_row
}
