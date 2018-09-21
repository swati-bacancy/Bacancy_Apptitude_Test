  Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
    root 'home#index'
    resources :tests
    resources :questions
    resources :technical_questions
    resources :collages
    resources :students
    resources :questions_tests, except: %i[new create]
    resources :student_answers, only: %i[new create] do
      collection do
        get 'new_technical'
        post 'create_technical'
      end
    end
    resources :results, only: %i[index show destroy edit update]
    get 'student/existing_user' => 'students#existing_user'
    post 'student/assign_test' => 'students#assign_test'
    get '/technical' => 'home#technical'
    delete "logout" => 'students#logout'
    get 'technical_answers/:id' => 'results#technical_answers', as: :technical_answers
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
