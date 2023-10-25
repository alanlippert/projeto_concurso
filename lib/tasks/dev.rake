# frozen_string_literal: true

namespace :dev do
  DEFAULT_PASSWORD = 123_456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc 'Configurando o ambiente'
  task setup: :environment do
    show_spinner('Apagando BD...') { `rails db:drop` }
    show_spinner('Criando BD...') { `rails db:create` }
    show_spinner('Migrando BD...') { `rails db:migrate` }
    show_spinner('Populando BD...') { `rails db:seed` }
    show_spinner('Cadastrando administrador padrão...') { `rails dev:add_default_admin` }
    show_spinner('Cadastrando assuntos padrões...') { `rails dev:add_subjects` }
    show_spinner('Cadastrando pergntas aleatórias...') { `rails dev:add_questions` }
  end

  desc 'Adiciona administrador padrão'
  task add_default_admin: :environment do
    add_login_admin('Alan', 'Magnus Lippert', 'alanlippert@hotmail.com', DEFAULT_PASSWORD, DEFAULT_PASSWORD)
    add_login_admin('Alan', 'Lippert', 'admin@admin.com', DEFAULT_PASSWORD, DEFAULT_PASSWORD)
    20.times do |_i|
      add_login_admin(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, DEFAULT_PASSWORD,
                      DEFAULT_PASSWORD)
    end
  end

  desc 'Adiciona assuntos padrões'
  task add_subjects: :environment do
    add_subjects
  end

  desc 'Adiciona questões aleatórias'
  task add_questions: :environment do
    add_questions
  end

  private

  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success('(Concluído!)')
  end

  def add_login_admin(first_name, last_name, email, password, password_confirmation)
    Admin.create!(
      first_name:,
      last_name:,
      email:,
      password:,
      password_confirmation:
    )
  end

  def add_subjects
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  def add_questions
    Subject.all.each do |subject|
      rand(5..10).times do
        params = { question: {
          description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          subject:,
          answers_attributes: []
        } }

        rand(2..5).times do
          params[:question][:answers_attributes].push(
            { description: Faker::Lorem.sentence, correct: false }
          )
        end

        index = rand(params[:question][:answers_attributes].size)
        params[:question][:answers_attributes][index] = { description: Faker::Lorem.sentence, correct: true }

        Question.create(params[:question])
      end
    end
  end
end
