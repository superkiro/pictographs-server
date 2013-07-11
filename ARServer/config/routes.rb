ARServer::Application.routes.draw do

	resources :pictographs
	match 'picto/:text' => 'pictographs#kiro'
	match 'getnames' => 'pictographs#sendNames'

end
