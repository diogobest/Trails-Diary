# frozen_string_literal: true

User.create(email: 'teste@teste.com', password: '123456')
Profile.create!(name: 'Rafael', age: 27, user_id: User.first.id)
Post.create!(title: 'São Bento do Sapucaí',
             text: 'São Bento do Sapucaí is a Brazilian municipality in São Paulo state.  Once known as a religious and traditional town, the municipality of São Bento do Sapucaí, now with its population reaching 10,000 inhabitants, is known for its mild weather, beautiful landscapes, and great conditions for the practice of many action sports. by wikipedia',
             state: 'MG',
             author: User.first.profile.name,
             profile_id: User.first.profile.id)
Post.create!(title: 'Rio de Janeiro',
             text: 'Rio de Janeiro (/ˈriːoʊ di ʒəˈnɛəroʊ, - deɪ -, - də -/; Portuguese: [ˈʁi.u d(ʒi) ʒɐˈne(j)ɾu] (About this soundlisten);[3]), or simply Rio,[4] is anchor to the Rio de Janeiro metropolitan area and the second-most populous municipality in Brazil and the sixth-most populous in the Americas. by wikipedia',
             state: 'SP',
             author: User.first.profile.name,
             profile_id: User.first.profile.id)
Post.create!(title: 'São Paulo',
             text: 'São Paulo (/ˌsaʊ ˈpaʊloʊ/; Portuguese pronunciation: [sɐ̃w̃ ˈpawlu] (About this soundlisten)) is a municipality in the Southeast Region of Brazil. The metropolis is an alpha global city (as listed by the GaWC) and the most populous city in Brazil, the Americas, the Western Hemisphere and the Southern Hemisphere - wikipedia',
             state: 'RJ',
             author: User.first.profile.name,
             profile_id: User.first.profile.id)
