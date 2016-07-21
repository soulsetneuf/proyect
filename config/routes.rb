Rails.application.routes.draw do

  resources :tuberculoses

  resources :tuberculosis

  get 'reporte/index'
  get 'reporte/pacientes'
  get 'reporte/detalle_insumos_reactivos'
  get 'reporte/insumo_reactivos_pacientes'
  get 'reporte/hospital'

  resources :laboratorios

  resources :personas

  resources :comunidads

  resources :municipios

  resources :line_items

  resources :carts

  get 'registro_insumos_reactivos/index2'

  resources :registro_insumos_reactivos

  resources :baciloscopia_forms

  resources :form_cultivos

  get 'configuraciones/index'

  resources :establecimientos

  resources :sectors

  resources :areas

  resources :distritos

  resources :provincia

  resources :kardexes

  resources :insumo_reactivos

  resources :inventarios

  resources :form_leishmaniases

  resources :form_malaria

  resources :form_chagas

  resources :form_tuberculoses

  resources :form_liquidos

  resources :biopsias_forms

  resources :form_anat_citologicas

  resources :form_cancer_uterinos

  resources :form_laboratorios

  resources :hospitals

  resources :diagnosticos

  resources :pacientes

  resources :rols

  get 'principal/index'

  devise_for :users
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'principal#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
