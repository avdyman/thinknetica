# frozen_string_literal: true

months = { january: 31, feburary: 28, march: 31, april: 30, may: 31, jun: 30, july: 31, augist: 31, september: 30,
           october: 31, november: 30, december: 31 }
thirty = months.select { |_mon, ind| ind == 30 }
thirty.each_key { |mon| puts mon, ' ' }
