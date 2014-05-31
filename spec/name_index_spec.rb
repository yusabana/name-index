require File.expand_path(File.dirname(__FILE__) + '/../name_index')

describe NameIndex do
  specify {
    expect(NameIndex.create_index(['キシモト', 'イトウ', 'カネダ', 'ワダ', 'ハマダ']))
      .to eq [ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']], ['ハ', ['ハマダ']], ['ワ', ['ワダ']] ]
  }

  specify {
    expect(NameIndex.create_index(['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ', 'ヲン']))
      .to eq [ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']], ['ハ', ['ハマダ', 'ババ']], ['ワ', ['ワダ', 'ヲン']] ]
  }
end


describe Dictionary do
  describe "#get_key" do
    skip
  end
end
