# frozen_string_literal: true

module AdminsBackoffice
  class WelcomeController < AdminsBackofficeController
    before_action :authenticate_admin!
    def index; end
  end
end
