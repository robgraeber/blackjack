#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model
  initialize: ->
    @set "playerChips", 20000
    @set 'deck', new Deck()
    @dealNewHand()

  dealerReveal: ->
    @get("dealerHand").at(0).set("revealed", true);
    setTimeout(@dealerPlayCard, 1000)

  dealerPlayCard: =>
    @get("dealerHand").hit() if @get("dealerHand").scores()[0] < 17

    if @get("dealerHand").scores()[0] < 17 
      setTimeout(@dealerPlayCard, 1000)
    else if @get("dealerHand").scores()[0] > 21
      @playerWin true
    else
      if @get("dealerHand").scores()[0] > @get("playerHand").scores()[0]
        @playerWin false
      else if @get("dealerHand").scores()[0] < @get("playerHand").scores()[0]
        @playerWin true
      else
        console.log("game draw")

    setTimeout => 
      @restartGame()
    , 1000

  playerWin: (isTrue) ->
    if isTrue
      console.log("player wins!")
      @set "playerChips", @get("playerChips") + 1000
    else
      console.log("dealer wins!")
      @set "playerChips", @get("playerChips") - 1000

  dealNewHand: ->
    console.log("Player chips: ", @get "playerChips");
    @set 'playerHand', @get("deck").dealPlayer()
    @set 'dealerHand', @get("deck").dealDealer()

    @get('playerHand').on 'add remove change', => 
      if @get("playerHand").scores()[0] > 21
        @playerWin false
        setTimeout => 
          @restartGame()
        , 1000

  restartGame: ->
    console.log("restarting game")
    @set 'deck', new Deck()
    @dealNewHand()
