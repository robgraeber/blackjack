class window.Play extends Backbone.Model

  initialize: (params) ->
    @set
      playerHand: params.playerHand
      dealerHand: params.dealerHand
      chipCount: params.chipCount
      