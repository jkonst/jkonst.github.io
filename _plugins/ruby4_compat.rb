# Liquid 4.x calls Object#tainted?, which was removed in Ruby 3.2.
# Tainting was already a no-op since Ruby 2.7, so returning false is correct.
# This shim is only active when tainted? is missing (Ruby >= 3.2).
class Object
  def tainted?
    false
  end
end unless Object.method_defined?(:tainted?)
