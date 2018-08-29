  Rails.application.routes.draw do
    root 'students#new'
    resources :tests
    resources :questions
    resources :students
    resources :questions_tests
    resources :student_answers
    delete "logout" => 'students#logout'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
