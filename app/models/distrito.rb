class Distrito < ActiveRecord::Base
  def to_s
    "#{nombre}"
  end
end
