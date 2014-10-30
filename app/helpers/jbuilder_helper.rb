module JbuilderHelper
  def fq_rescue_nil(foreign_key)
    unless foreign_key.nil?
      foreign_key
    else
      0
    end
  end
end
