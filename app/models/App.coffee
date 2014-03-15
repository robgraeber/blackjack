#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @dealNewHand()

  dealerPlay: ->
    @get("dealerHand").at(0).set("revealed", true);
    setTimeout(@dealerPlayCard, 1000)

  dealerPlayCard: =>
    @get("dealerHand").hit() if @get("dealerHand").scores()[0] < 17

    if @get("dealerHand").scores()[0] < 17 
      setTimeout(@dealerPlayCard, 1000)
    else if @get("dealerHand").scores()[0] > 21
      console.log "Dealer lose!!!"
      @restartGame()
    else
      if @get("dealerHand").scores()[0] > @get("playerHand").scores()[0]
        console.log("dealer wins!")
      else if @get("dealerHand").scores()[0] < @get("playerHand").scores()[0]
        console.log("player wins :(")
      else
        console.log("game draw")
      @restartGame()

  dealNewHand: ->
    @set 'playerHand', @get("deck").dealPlayer()
    @set 'dealerHand', @get("deck").dealDealer()

    @get('playerHand').on 'add remove change', => 
      if @get("playerHand").scores()[0] > 21
        console.log "Player lose!!!"
        @restartGame()

  restartGame: ->
    console.log("restarting game")
    @set 'playerHand', @get("deck").dealPlayer()
    @set 'dealerHand', @get("deck").dealDealer()

    @get('playerHand').on 'add remove change', => 
      if @get("playerHand").scores()[0] > 21
        console.log "Player lose!!!"
        @restartGame()
