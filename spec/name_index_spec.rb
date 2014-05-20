require File.expand_path(File.dirname(__FILE__) + '/../name_index')

describe NameIndex do
  specify { expect(NameIndex.create_index([])).to eq [] }
  specify { expect(NameIndex.create_index(['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ'])).to eq [ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']], ['ハ', ['ハマダ', 'ババ']], ['ワ', ['ワダ']] ] }
  specify { expect(NameIndex.create_index(['オカダ', 'ホリタ', 'ポリタ', 'ボリタ', 'ヨコヤマ'])).to eq [ ['ア', ['オカダ']], ['ハ', ['ホリタ', 'ボリタ', 'ポリタ']], ['ヤ', ['ヨコヤマ']] ] }
end