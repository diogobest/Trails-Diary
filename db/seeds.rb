# frozen_string_literal: true
user = User.create(email: 'teste@teste.com', password: '123456')
profile = Profile.create(name: 'Rafael', age: 27)
profile.user_id = user.id
posts = Post.create(title: 'São Bento do Sapucaí - MG - 01/01/2020', 
                    text: "Aqui vem a história", 
                    author: User.first.profile.name, 
                    profile_id: user.profile.id )

