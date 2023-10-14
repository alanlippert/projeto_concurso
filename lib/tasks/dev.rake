namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configurando o ambiente"
  task setup: :environment do
    show_spinner("Apagando BD...") { %x(rails db:drop) }
    show_spinner("Criando BD...") { %x(rails db:create) }
    show_spinner("Migrando BD...") { %x(rails db:migrate) }
    show_spinner("Populando BD...") { %x(rails db:seed) }
    show_spinner("Cadastrando administrador padrão...") { %x(rails dev:add_default_admin) }
  end

  task add_default_admin: :environment do
    add_login_admin("alanlippert@hotmail.com", DEFAULT_PASSWORD, DEFAULT_PASSWORD)
    add_login_admin("admin@admin.com", DEFAULT_PASSWORD, DEFAULT_PASSWORD)
  end
    

    def show_spinner(msg_start)
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(Concluído!)")
    end

    def add_login_admin(email, password, password_confirmation)
      Admin.create!(
        email: email,
        password: password,
        password_confirmation: password_confirmation
      )
    end

end
