  Rails.application.routes.draw do
    root 'home#index'
    resources :tests
    resources :questions
    resources :collages
    resources :students
    resources :questions_tests, except: %i[new create]
    resources :student_answers, only: %i[new create]
    resources :results, only: %i[index show destroy]
    get 'student/existing_user' => 'students#existing_user'
    post 'student/assign_test' => 'students#assign_test'
    get '/technical' => 'home#technical'
    delete "logout" => 'students#logout'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
