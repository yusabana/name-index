class NameIndex
  def self.create_index(names)
    name_values = names.map {|name| NameValue.new(name)}
    transform(name_values)
  end

  def self.transform(name_values)
    name_values.each_with_object({}) do |name_value, result|
      key = Dictionary.get_key(name_value)
      result[key] ||= []
      result[key] << name_value.name
      result[key].sort!
    end.sort.to_a
  end
end

class NameValue
  attr_reader :name, :index

  def initialize(name)
    @name = name
    @index = name[0]
  end
end

# unicodeの並び順 http://pentan.info/doc/unicode_list.html
class Dictionary
  @@contents =
    {
      "ア" => "ア".."オ",
      "カ" => "カ".."コ",
      "サ" => "サ".."ソ",
      "タ" => "タ".."ト",
      "ナ" => "ナ".."ノ",
      "ハ" => "ハ".."ホ",
      "マ" => "マ".."モ",
      "ヤ" => "ヤ".."ヨ",
      "ラ" => "ラ".."ロ",
      "ワ" => "ワ".."ン",
    }

  def self.get_key(name_value)
    @@contents.each do |c_key, c_range|
      if c_range.include?(name_value.index)
        return c_key
      end
    end

    raise "invalid letter, #{name_value.name}"
  end
end

