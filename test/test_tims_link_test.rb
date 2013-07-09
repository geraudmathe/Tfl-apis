require_relative "test_helper"
require "sax-machine" 
require "tfl_apis/tims/line"
require "tfl_apis/tims/link"


class Line; end

class LinkTest < Test::Unit::TestCase

  def toid
    123456789
  end

  def node_mock
    mock = mock()
    @line_result = stub

    xml = File.open("../fixtures/tims.xml", __FILE__).read
    mock.expects(:find_first).with("toid").returns(toid)
    mock.expects(:find_first).with("Line").returns(mock)
    Line.stubs(:new).with(mock).returns(@line_result)
    mock
  end

  def test_new_need_argument
    assert_raise ArgumentError do
      TflApis::Tims::Link.new
    end
  end

  def test_return_self
    report = TflApis::Tims::Link.new node_mock
    assert_equal TflApis::Tims::Link, report.class
  end

  def test_it_assign_toid_attribute
    report = TflApis::Tims::Link.new node_mock
    assert_equal report.toid, toid
  end

  def test_it_assign_line_attribute
    report = TflApis::Tims::Link.new node_mock
    assert report.line == @line_result
  end
end