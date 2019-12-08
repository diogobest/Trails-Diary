# frozen_string_literal: true

class UserDecorator < SimpleDelegator

  def new_session
    h.link_to 'Login', new_user_session_path
  end

  def delete_session
    h.link_to 'logout', destroy_user_session_path, method: :delete
  end
  
  def h
    ApplicationController.helpers
  end
end
