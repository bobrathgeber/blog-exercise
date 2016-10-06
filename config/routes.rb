Rails.application.routes.draw do
  resources :articles   #A resource is the term used for a collection
                        #of similar objects, such as articles, people
                        #or animals. You can create, read, update and destroy
                        #items for a resource and these operations are referred
                        #to as CRUD operations.
  resources :comments

  root 'welcome#index'  #sets fallback page to load
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
