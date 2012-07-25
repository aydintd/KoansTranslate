#!/usr/bin/ruby
# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrayAssignment < EdgeCase::Koan
  def test_non_parallel_assignment
    isimler = ["Can", "Guven"]
    assert_equal ["Can", "Guven"], isimler
  end

  def test_parallel_assignments
    isim, soy_isim = ["Can", "Guven"]
    assert_equal "Can", isim
    assert_equal "Guven", soy_isim
  end

  def test_parallel_assignments_with_extra_values
    isim, soy_isim = ["Can", "Guven", "III"]
    assert_equal "Can", isim
    assert_equal "Guven", soy_isim
  end

  def test_parallel_assignments_with_splat_operator
    isim, *soy_isim = ["Can", "Guven", "III"]
    assert_equal "Can", isim
    assert_equal ["Guven", "III"], soy_isim
  end

  def test_parallel_assignments_with_too_few_variables
    isim, soy_isim = ["Bora"]
    assert_equal "Bora", isim
    assert_equal nil, soy_isim
  end

  def test_parallel_assignments_with_subarrays
    isim, soy_isim = [["Veli", "Kamil"], "Haldun"]
    assert_equal ["Veli", "Kamil"], isim
    assert_equal "Haldun", soy_isim
  end

  def test_parallel_assignment_with_one_variable
    isim = ["Can", "Guven"]
    assert_equal ["Can", "Guven"], isim
  end

  def test_swapping_with_parallel_assignment
    isim = "Berk"
    soy_isim = "Turk"
    isim, soy_isim = soy_isim, isim
    assert_equal "Turk", isim
    assert_equal "Berk", soy_isim
  end
end
