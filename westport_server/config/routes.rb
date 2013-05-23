WestportServer::Application.routes.draw do
  get "api/createDepartment"

  get "api/createIncident"

  get "api/getDepartments"

  get "api/getIncidents"

  get "api/updateIncidents"

  get "test/createIncident"

  get "test/updateIncident"

  get "test/showIncident"

  devise_for :users
end
