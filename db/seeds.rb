# frozen_string_literal: true

User.create(email: 'teste@teste.com', password: '123456')
Profile.create!(name: 'Rafael', age: 27, user_id: user.id)
Post.create!(title: 'São Bento do Sapucaí',
             text: 'Aqui vem a história',
             author: User.first.profile.name,
             profile_id: user.profile.id)
Post.create!(title: 'Rio de Janeiro',
             text: 'Aqui vem a história',
             author: User.first.profile.name,
             profile_id: user.profile.id)
Post.create!(title: 'São Paulo',
             text: 'Aqui vem a história',
             author: User.first.profile.name,
             profile_id: user.profile.id)
