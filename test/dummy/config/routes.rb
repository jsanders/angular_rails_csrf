# frozen_string_literal: true

Dummy::Application.routes.draw do
  get  'test' => 'application#index'
  post 'test' => 'application#create'

  get 'exclusions' => 'exclusions#index'
end
