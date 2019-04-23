class Stats extends App.Controller
  constructor: ->
    super
    @load()

  load: =>
    stats_store = App.StatsStore.first()
    if stats_store
      @render(stats_store.data)
    else
      @render()

  render: (data = {}) ->
    if !data.StatsTicketEscalation
      data.StatsTicketEscalation =
        state: 'supergood'
        own: 0
        total: 0

    content = App.view('dashboard/stats/ticket_escalation')(data)

    if @$('.ticket_escalation').length > 0
      @$('.ticket_escalation').html(content)
    else
      @el.append(content)

App.Config.set('ticket_escalation', {controller: Stats, permission: 'ticket.agent', prio: 200 }, 'Stats')
