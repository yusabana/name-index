class NameIndex
  def self.create_index(names)
    transform(names.map{|name| NameValue.new(name)})
  end

  def self.transform(name_values)
    sorted_name_values = name_values.sort_by{|name_value| name_value.first}
    sorted_name_values.each_with_object(Hash.new {|h, k| h[k] = []}) do |name_value, result|
      key = Dictionary.get_key(name_value)
      result[key] << name_value.name
    end.to_a
  end
end

class NameValue
  attr_reader :name, :first

  def initialize(name)
    @name = name
    @first = name.chr
  end
end

# unicodeの並び順 http://pentan.info/doc/unicode_list.html
class Dictionary
  CONTENTS = {
    "ア" => "ア"..."カ",
    "カ" => "カ"..."サ",
    "サ" => "サ"..."タ",
    "タ" => "タ"..."ナ",
    "ナ" => "ナ"..."ハ",
    "ハ" => "ハ"..."マ",
    "マ" => "マ"..."ヤ",
    "ヤ" => "ヤ"..."ラ",
    "ラ" => "ラ"..."ワ",
    "ワ" => "ワ".."ン",
  }.freeze

  def self.get_key(name_value)
    CONTENTS.find do |c_index, c_range|
      c_range.include?(name_value.first)
    end.first
  end
end

