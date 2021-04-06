Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories do
        resources :ideas, only: :create
      end
    end
  end
end
