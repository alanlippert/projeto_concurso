module AdminsBackoffice
  class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    def index
      @subjects = Subject.all
    end
  end
end
