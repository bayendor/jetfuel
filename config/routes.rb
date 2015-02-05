Rails.application.routes.draw do
  get '/:id(/:desc)' => 'short_urls#show', :as => 'short_url'
  get '/' => 'short_urls#new', :as => 'new_short_url'
  post '/' => 'short_urls#create', :as => 'short_urls'
end
