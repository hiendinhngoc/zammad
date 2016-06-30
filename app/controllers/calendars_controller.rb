# Copyright (C) 2012-2014 Zammad Foundation, http://zammad-foundation.org/

class CalendarsController < ApplicationController
  before_action :authentication_check

  def index
    deny_if_not_role(Z_ROLENAME_ADMIN)

    # calendars
    assets = {}
    calendar_ids = []
    Calendar.all.order(:name, :created_at).each {|calendar|
      calendar_ids.push calendar.id
      assets = calendar.assets(assets)
    }

    ical_feeds = Calendar.ical_feeds
    timezones = Calendar.timezones
    render json: {
      calendar_ids: calendar_ids,
      ical_feeds: ical_feeds,
      timezones: timezones,
      assets: assets,
    }, status: :ok
  end

  def show
    deny_if_not_role(Z_ROLENAME_ADMIN)
    model_show_render(Calendar, params)
  end

  def create
    deny_if_not_role(Z_ROLENAME_ADMIN)
    model_create_render(Calendar, params)
  end

  def update
    deny_if_not_role(Z_ROLENAME_ADMIN)
    model_update_render(Calendar, params)
  end

  def destroy
    deny_if_not_role(Z_ROLENAME_ADMIN)
    model_destory_render(Calendar, params)
  end
end
