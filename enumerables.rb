require 'byebug'

class Array

  def my_each(&prc)
    i = 0

    while i < self.length
      prc.call(self[i])
      i += 1
    end
    return self
  end

  def my_select(&prc)
    res = []
    my_each {|e| res << e if prc.call(e)}
    return res
  end

  def my_reject(&prc)
    res = []
    my_each {|e| res << e if !prc.call(e)}
    return res
  end

  def my_any?(&prc)
    res = false
    my_each {|e| res = true if prc.call(e)}
    return res
  end

  def my_all?(&prc)
    res = true
    my_each {|e| res = false if !prc.call(e)}
    return res
  end
'''
  def my_flatten
    res = []

  end

  def add_new(list, new_item)
    if !new_item.is_a?(Array)
      list << new_item
    else
      list << add_new(new_item, )
    end
  end
'''
  def my_zip(*args)
    res = []
    self.each do |first|
      new_arr = []
      new_arr << first
      args.each do |arr|
        if arr.length > 0
          new_arr << arr.first
          arr.shift
        else
          new_arr << nil
        end
      end
      res << new_arr
    end
    return res
  end

  def my_rotate(idx = 1)
    return self.drop(idx%self.length).concat(self.take(idx%self.length))
  end

  def my_join(separator=' ')
    res = ''
    self.each do |e|
      res = res + e + separator
    end
    return res.rstrip
  end

  def my_reverse
    res = []
    (self.length-1).downto(0) do |i|
      res << self[i]
    end
    return res
  end

end

if __FILE__ == $PROGRAM_NAME
  return_value = [1, 2, 3].my_each do |num|
  puts num
  end.my_each do |num|
    puts num
  end
end
