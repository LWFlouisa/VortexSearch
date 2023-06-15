# VortexSearch
A way of shortening the search queries when looking for files.

## Query Engine
~~~ruby
require "VortexQuery/vortex_query.rb"

def create_modes
  Multisearch::CreateModes.from_list_modulate
end

def transition
  Multisearch::SearchFiles.transition
end

switch_state == true

if switch_state == true
  transition
else
  create_modes
end
~~~

## Phind Interpretation
This Ruby code defines a script that generates and adapts rulesets for an unknown purpose. The code is structured in two main functions: `create_rulesets` and `adaptation_vortex`. The code uses the `humanist_errors` library to handle errors in a human-friendly manner.

~~~

1. `create_rulesets` function:
   - Reads a text file `_rulesets/rules.txt` and stores its content in the `ruleset` variable.
   - Generates nine rulesets (`ruleset_1` to `ruleset_9`) by shifting the rules in the original ruleset.
   - Writes each generated ruleset to a separate text file in the `_adaptation` directory.

2. `adaptation_vortex` function:
   - Reads the current ruleset choice from the `_rulesets/choice/value.txt` file and stores it in the `ruleset_choice` variable. If the value is greater than 8, it resets to 0.
   - Reads the content of the nine text files generated by the `create_rulesets` function.
   - Selects the chosen ruleset based on the `ruleset_choice` variable.
   - Performs a series of system calls using the chosen ruleset.
   - Updates the `_rulesets/choice/value.txt` file with the incremented `ruleset_choice` value.
~~~

The script checks if `rule_creation` is true and, if so, calls both `create_rulesets` and `adaptation_vortex` functions. If `rule_creation` is false, it only calls the `adaptation_vortex` function.

The code seems to be a part of a larger system, where the rulesets are generated and adapted based on the current ruleset choice. The purpose of the rulesets and the system they are a part of is not clear from the provided code. 
