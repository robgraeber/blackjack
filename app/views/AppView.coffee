class window.AppView extends Backbone.View

  className: "main"
  template: _.template '
    <div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    </div>
    <div class="history-container"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> 
      @model.get('playerHand').hit()
    "click .stand-button": -> 
      @deactiveButtons()
      @model.get('playerHand').stand()
      @model.dealerReveal()

  deactiveButtons: ->
    console.log("deactiveButtons")
    $(".hit-button").prop("disabled",true);
    $(".stand-button").prop("disabled",true);

  initialize: -> 
    @render()
    @model.on "change:dealerHand", => 
      @render()
    

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.history-container').html new HistoryView(collection: @model.get 'history').el
