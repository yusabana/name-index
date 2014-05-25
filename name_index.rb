class NameIndex
  def self.create_index(names)
    name_values = names.map {|name| NameValue.new(name)}
    transform(name_values).to_a
  end

  # Dictionaryのコンテンツにマッチしたら出す
  def self.transform(name_values)
    name_values.each_with_object({}) do |name_value, ret|
      key = Dictionary.get_key(name_value)
      ret[key] ||= []
      ret[key] << name_value.name
      ret[key].sort!
    end.sort
  end
end

class NameValue
  attr_accessor :name, :index

  # 濁点付きのの文字列だったら濁点なくした奴に変換する
  def initialize(name)
    @name = name
    @index = name[0]
  end
end


# あ行、か行 などのメタを使って動的生成させるといいかも
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
    @@contents.each do |c_key, c_sets|
      if c_sets.include?(name_value.index)
        return c_key
      end
    end

    raise "不正な文字 #{name_value.name}"
  end
end

class DictionaryKey
end

class DictionaryContent
end
