require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def input_from_letters?(input, letters)
    input.chars.all? { |letter| input.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url)
    json = JSON.parse(response.read)
    json['found']
  end

  def score
    @letters = params[:letters].split(' ')
    @input = params[:word].upcase

    if !input_from_letters?(@input, @letters)
      @result = "Sorry but <b>#{@input}</b> can't be built out of #{@letters.join(', ')}.".html_safe
    elsif !english_word?(@input)
      @result = "Sorry but <b>#{@input}</b> does not seem to be a valid English word.".html_safe
    else
      @result = "Congratulations! <b>#{@input}</b> is a valid English word!".html_safe
    end
  end
end
