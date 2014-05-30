class NameIndex
  def self.create_index(names)
    name_values = names.map {|name| Name.new(name)}
    transform(name_values).to_a
  end

  def self.transform(name_values)
    name_values.each_with_object({}) do |name_value, ret|
      key = Dictionary.get_key(name_value)
      ret[key] ||= []
      ret[key] << name_value.name
      ret[key].sort!
    end.sort
  end
end

class Name
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

  def self.contents
    @@contents
  end

  def self.get_key(name_value)
    @@contents.each do |c_key, c_range|
      if c_range.include?(name_value.index)
        return c_key
      end
    end

    raise "invalid letter, #{name_value.name}"
  end
end

