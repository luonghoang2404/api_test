Rails.application.routes.draw do
  resources :departments
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'api/managers.json' => 'employees#managers'
  get 'api/young_managers.json' => 'employees#young_managers'
  get 'api/employee/top_departments.json' => 'departments#top_employees'
  get 'api/manager/departments.json' => 'departments#at_least_one_managers'
end
