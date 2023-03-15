# frozen_string_literal: true

# Создать модуль, который позволит указывать название компании-производителя и получать его.
# Подключить модуль к классам Вагон и Поезд

module Manufacturer
  def set_manufacturer(name_company)
    @company = name_company
  end

  def get_manufacturer
    @company
  end
end
