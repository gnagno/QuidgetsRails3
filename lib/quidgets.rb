# Quidgets
ActionView::Base.send :include, QuidgetsHelper

class ::Hash
  def is_a_special_hash?
    true
  end
end
