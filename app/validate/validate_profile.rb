# frozen_string_literal: true

class ValidateProfile
  attr_reader :params

  def initialize(params:)
    @params = params
  end

  def valid?
    validate_age
    params
  end

  private

  def validate_age
    if (params[:age].to_i < 12 || params[:age].to_i > 120) && params[:age].present?
      raise CustomExceptions::InvalidAge
    end
  end
end
