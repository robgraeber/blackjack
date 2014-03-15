class window.HistoryView extends Backbone.View

  className: "history"

  tagName:"table"

  initialize: ->
    @collection.on "add remove change", => 
      @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.append($("<thead><th class='titleRow' colSpan='3' style='text-align:center'>Plays</th></thead>"))
    @$el.append($("<tr>").append($("<th class='headerRow'>").text("Player")).append($("<th class='headerRow'>").text("Dealer")).append($("<th class='headerRow'>").text("Chip Count")))
    @$el.append @collection.map (play) ->
      new HistoryEntryView(model: play).$el
    @$el.append($("<tfoot><td></td></tfoot>"))