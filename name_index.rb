class NameIndex
  GROUP_CHARS = %w(ア カ サ タ ナ ハ マ ヤ ラ ワ ン).freeze

  class << self
    def create_index(names)
      names.sort.group_by{|name| group_char_for(name) }.to_a
    end

    def group_char_for(name)
      GROUP_CHARS.each_cons(2).find {|from, to| (from...to).include? name[0] }.first
    end
  end
end