# frozen_string_literal: true

require 'rails_helper'

describe CardsPresenter do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }
  let! (:post) do
    FactoryBot.create(:post, author: profile.name,
                             profile_id: profile.user.id)
  end
end
