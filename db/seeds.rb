# frozen_string_literal: true

User.create(email: 'teste@teste.com', password: '123456')
Profile.create!(name: 'Rafael', age: 27, user_id: User.first.id)
Post.create!(title: 'São Bento do Sapucaí',
             text: 'Aqui vem a história',
             state: 'MG',
             author: User.first.profile.name,
             profile_id: User.first.profile.id)
Post.create!(title: 'Rio de Janeiro',
             text: 'Aqui vem a história',
             state: 'SP',
             author: User.first.profile.name,
             profile_id: User.first.profile.id)
Post.create!(title: 'São Paulo',
             text: 'Aqui vem a história',
             state: 'RJ',
             author: User.first.profile.name,
             profile_id: User.first.profile.id)
