class ApiController < ApplicationController
  def createDepartment
	Department.create(dep_id: params[:dep_id], name: params[:name], location: params[:location])
	@view = Department.all
  end

  def createIncident
	@view = Incident.create(incident: params[:incident], type: params[:type], unit: params[:unit], comment: params[:comment], location: params[:location], status: params[:status], group: params[:group], dt: DateTime.parse(params[:dt]))
	if(params.has_key?(:dep_id))
		Department.where(dep_id: params[:dep_id]).first.incidents.push(@view)
	end
	@view = Incident.all
  end

  def getDepartments
	@view = Department.all
  end

  def getIncidents
	if(params.has_key?(:dep_id))
		@view = Department.where(dep_id: params[:dep_id]).first.incidents
	else
		@view = Incident.all
	end
  end

  def updateIncidents
	@view = Incident.where(incident: params[:incident]).first
	if (params.has_key?(:type))
		@view.type = params[:type]
	end
	if (params.has_key?(:unit))
		@view.unit = params[:unit]
	end
	if (params.has_key?(:comment))
		@view.comment = params[:comment]
	end
	if (params.has_key?(:location))
		@view.location = params[:location]
	end
	if (params.has_key?(:status))
		@view.status = params[:status]
	end
	if (params.has_key?(:group))
		@view.group = params[:group]
	end
	@view.dt = DateTime.parse(params[:dt])
	@view.save
	@view = Incident.all
  end
end
