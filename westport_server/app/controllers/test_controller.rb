class TestController < ApplicationController
  def createIncident
	@view = Incident.create(incident: 3, type: 'test', unit: 'police', comment: 'new comment', location: 'new location', status: 'new status', group: 'new group', dt: DateTime.now)
  end

  def updateIncident
	@view = Incident.where(incident: 1).first
	@view.comment = 'Different Comment'
	@view.dt = DateTime.now
	@view.save
	puts @view.to_json
  end

  def showIncident
	@view = Incident.all
  end
end
