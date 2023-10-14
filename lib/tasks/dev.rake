# frozen_string_literal: true

namespace :dev do
  DEFAULT_PASSWORD = 123_456

  desc 'Configurando o ambiente'
  task setup: :environment do
    show_spinner('Apagando BD...') { `rails db:drop` }
    show_spinner('Criando BD...') { `rails db:create` }
    show_spinner('Migrando BD...') { `rails db:migrate` }
    show_spinner('Populando BD...') { `rails db:seed` }
    show_spinner('Cadastrando administrador padrão...') { `rails dev:add_default_admin` }
  end

  desc 'Adiciona administrador padrão'
  task add_default_admin: :environment do
    add_login_admin('alanlippert@hotmail.com', DEFAULT_PASSWORD, DEFAULT_PASSWORD)
    add_login_admin('admin@admin.com', DEFAULT_PASSWORD, DEFAULT_PASSWORD)
    10.times { |_i| add_login_admin(Faker::Internet.email, DEFAULT_PASSWORD, DEFAULT_PASSWORD) }
  end

  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success('(Concluído!)')
  end

  def add_login_admin(email, password, password_confirmation)
    Admin.create!(
      email:,
      password:,
      password_confirmation:
    )
  end
end
