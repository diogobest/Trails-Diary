# frozen_string_literal: true
user = User.create(email: 'teste@teste.com', password: '123456')
profile = Profile.create(name: 'Rafael', age: 27)
profile.user_id = user.id
