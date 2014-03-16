class window.Card extends Backbone.Model

  initialize: (params) ->
    @set
      revealed: true
      #value = (!params.rank || params.rank > 10) ? 10 : params.rank
      #
      #
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  flip: ->
    @set 'revealed', !@get('revealed')
    @

  translate: (suitName) ->
    switch suitName
      when 'Spades' then "&spades;"
      when 'Diamonds' then "&diams;"
      when 'Hearts' then "&hearts;"
      when 'Clubs' then "&clubs;"

  translateValue:  ->
    switch @get('rankName')
      when 2 then "two"
      when 3 then "three"
      when 4 then "four"
      when 5 then "five"
      when 6 then "six"
      when 7 then "seven"
      when 8 then "eight"
      when 9 then "nine"
      when 10 then "ten"
      when "King" then "king"
      when "Ace" then "ace"
      when "Jack" then "jack"
      when "Queen" then "queen"