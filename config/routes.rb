  Rails.application.routes.draw do
    root 'home#index'
    resources :tests
    resources :questions
    resources :students
    resources :questions_tests
    resources :student_answers
    resources :results, only: %i[index show]
    get 'student/existing_user' => 'students#existing_user'
    post 'student/assign_test' => 'students#assign_test'
    delete "logout" => 'students#logout'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
