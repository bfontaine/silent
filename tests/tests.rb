#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'coveralls'
Coveralls.wear!

require 'test/unit'
require 'simplecov'

test_dir = File.expand_path( File.dirname(__FILE__) )

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start { add_filter '/tests/' }

require 'silent'

class SilentTests < Test::Unit::TestCase
  def setup
    @_stdout, $stdout = $stdout, StringIO.new
    @_stderr, $stderr = $stderr, StringIO.new
  end

  def teardown
    $stdout = @_stdout
    $stderr = @_stderr
  end

  def test_no_block
    assert_nil(silent)
    assert_nil(silent(:stdout))
    assert_nil(silent(:stderr))
    assert_nil(silent(:stdout, :stderr))
  end

  def test_returned_value
    n = rand
    res = silent { n }
    assert_equal(n, res)
  end

  def test_silent_stderr_no_stdout
    s = 'bar'
    silent(:stderr) do
      $stderr.write('foo')
      print s
    end

    $stderr.seek(0)
    $stdout.seek(0)

    assert_equal('', $stderr.read)
    assert_equal(s, $stdout.read)
  end

  def test_silent_stderr_and_stdout
    silent(:stderr, :stdout) do
      $stderr.write('bar')
      print 'foo'
    end

    $stderr.seek(0)
    $stdout.seek(0)

    assert_equal('', $stderr.read)
    assert_equal('', $stdout.read)
  end

  def test_silent_stdout_no_stderr
    s = 'bar'
    silent(:stdout) do
      print 'foo'
      $stderr.write(s)
    end

    $stderr.seek(0)
    $stdout.seek(0)

    assert_equal(s, $stderr.read)
    assert_equal('', $stdout.read)
  end
end


exit Test::Unit::AutoRunner.run
