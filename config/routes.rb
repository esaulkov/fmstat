# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsPgExtras::Web::Engine, at: 'pg_extras'

  root 'home#index'
end
