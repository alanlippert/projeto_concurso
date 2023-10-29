# frozen_string_literal: true

class UsersBackofficeController < ApplicationController
  layout 'users_backoffice'
  before_action :authenticate_user!
end
