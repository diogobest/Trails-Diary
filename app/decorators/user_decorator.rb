# frozen_string_literal: true

class UserDecorator < SimpleDelegator
  def new_session
    helper.link_to 'Login', new_user_session_path
  end

  def delete_session
    helper.link_to 'logout', destroy_user_session_path, method: :delete
  end

  private

  def helper
    ApplicationController.helpers
  end
end
