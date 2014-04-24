# -*- coding: UTF-8 -*-

# Silently execute a block. Arguments should be :stdout and/or :stderr, and a
# block should be given.
def silent(*what)
  return unless block_given?

  _stdout, $stdout = $stdout, StringIO.new if what.include?(:stdout)
  _stderr, $stderr = $stderr, StringIO.new if what.include?(:stderr)

  res = yield

  $stdout = _stdout if what.include?(:stdout)
  $stderr = _stderr if what.include?(:stderr)

  res
end
