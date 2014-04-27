# -*- coding: UTF-8 -*-

# Silently execute a block.
# @param what [Symbol] output to silent. This must be either +:stdout+ or
#                      +:stderr:+. More than can be given.
# @yield []
# @return block's returned value
def silent(*what)
  return unless block_given?

  _stdout, $stdout = $stdout, StringIO.new if what.include?(:stdout)
  _stderr, $stderr = $stderr, StringIO.new if what.include?(:stderr)

  res = yield

  $stdout = _stdout if what.include?(:stdout)
  $stderr = _stderr if what.include?(:stderr)

  res
end
