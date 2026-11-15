# Liquid 4.0.3 calls Object#tainted? and String#untaint (e.g. in the escape
# filter), which were removed in Ruby 3.2. Tainting was already a no-op since
# Ruby 2.7, so these shims keep the old behaviour. They are only defined when
# the methods are missing (Ruby >= 3.2), and only matter for local builds:
# GitHub Pages ignores _plugins and uses a Liquid version without these calls.
class Object
  def tainted?
    false
  end unless method_defined?(:tainted?)

  def untaint
    self
  end unless method_defined?(:untaint)
end
