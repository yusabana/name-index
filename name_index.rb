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
      "ア" => Set["ア", "イ", "ウ", "エ", "オ"],
      "カ" => Set["カ", "キ", "ク", "ケ", "コ"],
      "サ" => Set["サ", "シ", "ス", "セ", "ソ"],
      "タ" => Set["タ", "チ", "ツ", "テ", "ト"],
      "ナ" => Set["ナ", "ニ", "ヌ", "ネ", "ノ"],
      "ハ" => Set["ハ", "ヒ", "フ", "ヘ", "ホ"],
      "マ" => Set["マ", "ミ", "ム", "メ", "モ"],
      "ヤ" => Set["ヤ", "ユ", "ヨ"],
      "ラ" => Set["ラ", "リ", "ル", "レ", "ロ"],
      "ワ" => Set["ワ", "ヲ", "ン"],
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
