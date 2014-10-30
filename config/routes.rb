Yesser::Application.routes.draw do
  scope '(:locale)', locale: /en|ar/, :path_prefix => '/:locale' do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end
  scope '(:locale)', locale: /en|ar/, :path_prefix => '/(:locale)' do
    resources :messages

    root :to => "organization_users#home"

    resources :faqs

    namespace :api, defaults: { format: :json} do
      namespace :v1, defaults: { format: :json } do
        resources :apps, only: [:index, :show]
        resources :cities, only: [:index, :show]
        resources :organizations, only: [:show] do
          resources :messages, only: [:index, :show]
          resources :complaint, only: [:index]
          resources :agencies, only: [:index, :show]
          resources :polls, only: [:index, :show] do
            member do
              post "answer" => "polls#answer_poll"
            end
          end
          resources :eservices, only: [:index, :show]
          resources :eservice_categories, only: [:index, :show]
          resources :agency_categories, only: [:index, :show]
          resources :faqs, only: [:index, :show]
          member do
            get "rss" => "rsses#show"
          end
        end
      end
    end

    scope :complaints, as: :complaints do
      get "email_edit" => "complaints#email_edit"
      match "email_update", to: "complaints#email_update", via: [:put, :patch]
      get "agency_edit" => "complaints#agency_edit"
      match "agency_update", to: "complaints#agency_update", via: [:put, :patch]
      get "index" => "complaints#index"
      get "switch_method" => "complaints#switch_method"
    end

    resources :polls

    resources :rsses, except: [:show] do
      collection do
        get '' => "rsses#show", as: :show
      end
    end
    resources :news

    # get "(/agency_categories/:agency_category_id)/agency/:id", 
        # to: "agencies#show", as: "show_agency"
    resources :agency_categories, except: [:show] do
      resources :agencies
    end

    resources :eservice_categories, except: [:show] do
      resources :eservices
    end
    resources :eservices do
      member do
        get "move"
        patch "apply_move"
      end
    end
    resources :agencies do
      member do
        get "move"
        patch "apply_move"
      end
      resources :eservice_categories, except: [:show] do
        resources :eservices
      end
      resources :eservices, only: [:new]
    end

    resources :organizations, :only => [:show, :edit, :update]

    devise_for :organization_users,
      path: "auth", path_names: { sign_in: 'login', sign_out: "logout" }

    resource :organization_users, only: [:edit, :home] do
      root to: :home
      collection do
        patch 'update_password'
      end
    end
    
    resources :apps

    resources :statistics
  end
end
