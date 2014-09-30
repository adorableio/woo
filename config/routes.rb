Woo::Engine.routes.draw do
  root 'styleguide#index'
  get '/:folder/:page' => 'styleguide#page',
    :page   => :page,
    :folder => :folder
end
