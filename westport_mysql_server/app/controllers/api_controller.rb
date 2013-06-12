class ApiController < ApplicationController
  def create_incident
    @in = Incident.create()
    params.each do |key, value|
      if ((key == 'controller' && value != 'api') && (key == 'action' && value != 'create_incident') || (key != 'controller' && key != 'action') )
        type = IncidentType.find_or_create_by_name(key)
        IncidentData.create(:incident_id => @in.id, :incident_type_id => type.id, :value => value)
      end
    end
    @join_in =  Incident.find(@in.id).as_json(:include => { :incident_datas => { 
                                                                  :include => { :incident_type => {
                                                                                  :only => :name } },
                                                                  :only => [:value, :created_at] } }).to_json.html_safe
  end

  def update_incident
    @in = Incident.find(params[:id])
    params.each do |key, value|
      if ((key != 'id') && ((key == 'controller' && value != 'api') && (key == 'action' && value != 'update_incident') || (key != 'controller' && key != 'action')))
        type = IncidentType.find_or_create_by_name(key)
        IncidentData.create(:incident_id => @in.id, :incident_type_id => type.id, :value => value)
      end
    end
    @join_in =  Incident.find(@in.id).as_json(:include => { :incident_datas => { 
                                                                  :include => { :incident_type => {
                                                                                  :only => :name } },
                                                                  :only => [:value, :created_at] } }).to_json.html_safe
  end

  def create_staff
    @staff = Staff.create(:name => params[:name], :position => params[:pos])
  end

  def update_staff
    if params_check(:name)
      Staff.find(params[:id]).update_attributes(:name => params[:name])
    end
    if params_check(:pos)
      Staff.find(params[:id]).update_attributes(:position => params[:pos])
    end
    @staff = Staff.find(params[:id])
  end

  def get_staff
    if (params_check(:id))
      @staff = Staff.find(params[:id])
    else
      @staff = Staff.all
    end
  end

  def get_incident
    if (params_check(:id))
      @join_in =  Incident.find(params[:id]).as_json(:include => { :incident_datas => { 
                                                                    :include => { :incident_type => {
                                                                                    :only => :name } },
                                                                    :only => [:value, :created_at] } }).to_json.html_safe
    else
      @join_in =  Incident.all.as_json(:include => { :incident_datas => { 
                                                      :include => { :incident_type => {
                                                                      :only => :name } },
                                                      :only => [:value, :created_at] } }).to_json.html_safe
    end
  end
  def params_check(*args)
    if args.length == 1
      if args[0].class == Array
        if params[args[0][0]][args[0][1]] && !params[args[0][0]][args[0][1]].empty?
          true
        end
      else        
        if params[args[0]] && !params[args[0]].empty?
          true
        end
      end
    elsif args.length == 2
      if args[0].class == Array
        if params[args[0][0]][args[0][1]] && params[args[0][0]][args[0][1]] == args[1]
          true
        end
      else
        if params[args[0]] && params[args[0]] == args[1]
          true
        end
      end  
    end
  end
end
