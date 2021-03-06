require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrays < EdgeCase::Koan
  def test_creating_arrays
    bos_dizi = Array.new
    assert_equal Array, bos_dizi.class
    assert_equal 0, bos_dizi.size
  end

  def test_array_literals
    dizi = Array.new
    assert_equal [], dizi

    dizi[0] = 1
    assert_equal [1], dizi

    dizi[1] = 2
    assert_equal [1, 2], dizi

    dizi << 333
    assert_equal [1, 2, 333], dizi
  end

  def test_accessing_array_elements
    dizi = [:fistik, :yag, :ve, :recel]

    assert_equal :fistik, dizi[0]
    assert_equal :fistik, dizi.first
    assert_equal :recel, dizi[3]
    assert_equal :recel, dizi.last
    assert_equal :recel, dizi[-1]
    assert_equal :yag, dizi[-3]
  end

  def test_slicing_arrays
    dizi = [:fistik, :yag, :ve, :recel]

    assert_equal [:fistik], dizi[0,1]
    assert_equal [:fistik, :yag], dizi[0,2]
    assert_equal [:ve, :recel], dizi[2,2]
    assert_equal [:ve, :recel], dizi[2,20]
    assert_equal [], dizi[4,0]
    assert_equal [], dizi[4,100]
    assert_equal nil, dizi[5,0]
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a
  end

  def test_slicing_with_ranges
    dizi = [:fistik, :yag, :ve, :recel]

    assert_equal [:fistik, :yag, :ve], dizi[0..2]
    assert_equal [:fistik, :yag], dizi[0...2]
    assert_equal [:ve, :recel], dizi[2..-1]
  end

  def test_pushing_and_popping_arrays
    dizi = [1,2]
    dizi.push(:son)

    assert_equal [1, 2, :son], dizi

    cekilen_deger = dizi.pop
    assert_equal :son, cekilen_deger
    assert_equal [1, 2], dizi
  end

  def test_shifting_arrays
    dizi = [1,2]
    dizi.unshift(:ilk)

    assert_equal [:ilk, 1 ,2], dizi

    aktarilan_deger = dizi.shift
    assert_equal :ilk, aktarilan_deger
    assert_equal [1, 2], dizi
  end

end
