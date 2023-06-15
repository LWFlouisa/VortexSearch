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
