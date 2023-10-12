# frozen_string_literal: true

module UsersBackoffice
  class WelcomeController < UsersBackofficeController
    before_action :authenticate_user!
    def index; end
  end
end
