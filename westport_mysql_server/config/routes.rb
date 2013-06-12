WestportMysqlServer::Application.routes.draw do
  get "api/create_incident"

  get "api/update_incident"

  get "api/create_staff"

  get "api/update_staff"

  get "api/get_incident"
  
  get "api/get_staff"

end
