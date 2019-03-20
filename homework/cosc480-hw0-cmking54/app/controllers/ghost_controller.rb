class GhostController < ApplicationController
  include GhostHelper

  def play
   @word = params[:current_word] || ""
   letter = params[:letter] || "" 
   if letter.chomp =~ /[a-z]/i
    @word += letter.chomp
   end 
   ## win cond
   @lost = !starts_word?(@word) || @word.length >= 3 && is_word?(@word)
   ##
  end
end
