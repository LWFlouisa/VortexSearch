module Multisearch

  class CreateModes
    def self.snapshot_ruleset
      row = 0 ## The value of row is 0.

      ## The directory knwon_ruleset is _ruleset/rules.txt
      ruleset = File.readlines("_rulesets/rules.txt")

      ### Values of the individual rows, as Ruby counts from zero.
      rule1 = 0 #row + 1
      rule2 = 1 #row + 2
      rule3 = 2 #row + 3
      rule4 = 3 #row + 4
      rule5 = 4 #row + 5
      rule6 = 5 #row + 6
      rule7 = 6 #row + 7
      rule8 = 7 #row + 8
      rule9 = 8 #row + 9

      first_rule    = ruleset[rule1].tr "
", ""
      second_rule   = ruleset[rule2].tr "
", ""
      third_rule    = ruleset[rule3].tr "
", ""
      fourth_rule   = ruleset[rule4].tr "
", ""
      fifth_rule    = ruleset[rule5].tr "
", ""
      sixth_rule    = ruleset[rule6].tr "
", ""
      seventh_rule  = ruleset[rule7].tr "
", ""
      eighth_rule   = ruleset[rule8].tr "
", ""
      nineth_rule   = ruleset[rule9].tr "
", ""

      ### Creation of the actual rulesets.
      ruleset_1 = "#{first_rule}
#{second_rule}
#{third_rule}
#{fourth_rule}
#{fifth_rule}
#{sixth_rule}
#{seventh_rule}
#{eighth_rule}
#{nineth_rule}"

      ruleset_2 = "#{nineth_rule}
#{first_rule}
#{second_rule}
#{third_rule}
#{fourth_rule}
#{fifth_rule}
#{sixth_rule}
#{seventh_rule}
#{eighth_rule}"

      ruleset_3 = "#{eighth_rule}
#{nineth_rule}
#{first_rule}
#{second_rule}
#{third_rule}
#{fourth_rule}
#{fifth_rule}
#{sixth_rule}
#{seventh_rule}"

      ruleset_4 = "#{seventh_rule}
#{eighth_rule}
#{nineth_rule}
#{first_rule}
#{second_rule}
#{third_rule}
#{fourth_rule}
#{fifth_rule}
#{sixth_rule}"

      ruleset_5 = "#{sixth_rule}
#{seventh_rule}
#{eighth_rule}
#{nineth_rule}
#{first_rule}
#{second_rule}
#{third_rule}
#{fourth_rule}
#{fifth_rule}"

      ruleset_6 = "#{fifth_rule}
#{sixth_rule}
#{seventh_rule}
#{eighth_rule}
#{nineth_rule}
#{first_rule}
#{second_rule}
#{third_rule}
#{fourth_rule}"

      ruleset_7 = "#{fourth_rule}
#{fifth_rule}
#{sixth_rule}
#{seventh_rule}
#{eighth_rule}
#{nineth_rule}
#{first_rule}
#{second_rule}
#{third_rule}"

      ruleset_8 = "#{third_rule}
#{fourth_rule}
#{fifth_rule}
#{sixth_rule}
#{seventh_rule}
#{eighth_rule}
#{nineth_rule}
#{first_rule}
#{second_rule}"

      ruleset_9 = "#{second_rule}
#{third_rule}
#{fourth_rule}
#{fifth_rule}
#{sixth_rule}
#{seventh_rule}
#{eighth_rule}
#{nineth_rule}
#{first_rule}"

      open("_adaptation/ruleset_shift1.txt", "w") { |f|
        f.puts ruleset_1
      }

      open("_adaptation/ruleset_shift2.txt", "w") { |f|
        f.puts ruleset_2
      }

      open("_adaptation/ruleset_shift3.txt", "w") { |f|
        f.puts ruleset_3
      }

      open("_adaptation/ruleset_shift4.txt", "w") { |f|
        f.puts ruleset_4
      }

      open("_adaptation/ruleset_shift5.txt", "w") { |f|
        f.puts ruleset_5
      }

      open("_adaptation/ruleset_shift6.txt", "w") { |f|
        f.puts ruleset_6
      }

      open("_adaptation/ruleset_shift7.txt", "w") { |f|
        f.puts ruleset_7
      }

      open("_adaptation/ruleset_shift8.txt", "w") { |f|
        f.puts ruleset_8
      }

      open("_adaptation/ruleset_shift9.txt", "w") { |f|
        f.puts ruleset_9
      }
    end

    def self.adapt_each_vortex
      ## Create new sound_file with new ruleset permutation.
      ruleset_choice = File.read("_rulesets/choice/value.txt").to_s.to_i

      # Resets reset choice if at 8 in Ruby.
      if ruleset_choice > 8
        ruleset_choice = 0
      end

      mutation1 = File.readlines("_adaptation/ruleset_shift1.txt")
      mutation2 = File.readlines("_adaptation/ruleset_shift2.txt")
      mutation3 = File.readlines("_adaptation/ruleset_shift3.txt")
      mutation4 = File.readlines("_adaptation/ruleset_shift4.txt")
      mutation5 = File.readlines("_adaptation/ruleset_shift5.txt")
      mutation6 = File.readlines("_adaptation/ruleset_shift6.txt")
      mutation7 = File.readlines("_adaptation/ruleset_shift7.txt")
      mutation8 = File.readlines("_adaptation/ruleset_shift8.txt")
      mutation9 = File.readlines("_adaptation/ruleset_shift9.txt")

      ruleset_list = [
        mutation1, mutation2, mutation3,
        mutation4, mutation5, mutation6,
        mutation7, mutation8, mutation9,
      ]

      chosen_ruleset = ruleset_list[ruleset_choice]

      ## These are the rows.
      vortex_row_1 = 0
      vortex_row_2 = 1
      vortex_row_4 = 3
      vortex_row_8 = 7
      vortex_row_7 = 6
      vortex_row_5 = 4

      ## Performs standard subroutines.
      system("#{chosen_ruleset[vortex_row_1]}")
      system("#{chosen_ruleset[vortex_row_2]}")
      system("#{chosen_ruleset[vortex_row_4]}")
      system("#{chosen_ruleset[vortex_row_8]}")
      system("#{chosen_ruleset[vortex_row_7]}")
      system("#{chosen_ruleset[vortex_row_5]}")
      system("#{chosen_ruleset[vortex_row_1]}")

      open("_rulesets/choice/value.txt", "w") { |f|
        ruleset_choice = ruleset_choice + 1

        f.puts ruleset_choice
      }
    end

    def self.from_list_modulate
      Multisearch::CreateModes.snapshot_ruleset
      Multisearch::CreateModes.adapt_each_vortex
    end
  end

  class SearchFiles
    attr_reader :state

    def initialize
      @state = "inactive"
    end

    def self.mode_1
      present_vortex = File.readlines("_adaptation/ruleset_shift1.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_2
      present_vortex = File.readlines("_adaptation/ruleset_shift2.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_3
      present_vortex = File.readlines("_adaptation/ruleset_shift3.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_4
      present_vortex = File.readlines("_adaptation/ruleset_shift4.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_5
      present_vortex = File.readlines("_adaptation/ruleset_shift5.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_6
      present_vortex = File.readlines("_adaptation/ruleset_shift6.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_7
      present_vortex = File.readlines("_adaptation/ruleset_shift7.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_8
      present_vortex = File.readlines("_adaptation/ruleset_shift8.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.mode_9
      present_vortex = File.readlines("_adaptation/ruleset_shift9.txt")

      row = 0

      iteration == present_vortex.size.to_i

      iteration.times do
        active_rule = present_vortex[row].strip

        ## Files to open and analyze should be contained in _prolog/[your script name].pl Remember to use halt. to exit prolog.
        if File.exist("#{active_rule}")
           system("#{active_rule}")
        else
           puts ">> There is specific file is not available to analyze."
        end
      end
    end

    def self.transition
      case state

      when "inactive"
        puts "Multi search tool currently inactive..."

        @state = "first node"
      when "first mode"
        Multisearch::SearchFiles.mode_1

        @state = "second mode"
      when "second mode"
        Multisearch::SearchFiles.mode_2

        @state = "third mode"
      when "third mode"
        Multisearch::SearchFiles.mode_3

        @state = "fourth mode"
      when "fourth mode"
        Multisearch::SearchFiles.mode_4

        @state = "fith mode"
      when "fifth mode"
        Multisearch::SearchFiles.mode_5

        @state = "sixth mode"
      when "sixth mode"
        Multisearch::SearchFiles.mode_6

        @state = "seventh mode"
      when "seventh mode"
        Multisearch::SearchFiles.mode_7

        @state = "seventh mode"
      when "eighth mode"
        Multisearch::SearchFiles.mode_8

        @state = "eighth mode"
      when "nineth mode"
        Multisearch::SearchFiles.mode_9

        @state = "inactive"
      end
    end
  end

end
