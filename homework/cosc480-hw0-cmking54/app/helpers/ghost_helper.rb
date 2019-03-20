#
# cosc480 hw0 scaffold code for ghost; jsommers@colgate.edu
#
module GhostHelper
  WORDS ||= begin
    infile = File.open(File.join(Rails.public_path, "words.txt"))
    words = []
    infile.each_line do |w|
      w = w.upcase.chomp
      words << w unless w.length < 3
    end
    words.sort!
  end

  def starts_word?(fragment)
    fragment = fragment.upcase
    start = WORDS.bsearch { |w| w >= fragment }
    if start.nil?
        false
    else
        start.start_with? fragment
    end
  end

  def is_word?(fragment)
    fragment = fragment.upcase
    start = WORDS.bsearch { |w| w >= fragment }
    if start.nil?
        false
    else
        start == fragment
    end
  end
end
