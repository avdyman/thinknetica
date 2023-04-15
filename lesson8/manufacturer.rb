# frozen_string_literal: true

# This is module
module Manufacturer
  def manufacturing(name_company)
    @company = name_company
  end

  def manufactured
    @company
  end
end
