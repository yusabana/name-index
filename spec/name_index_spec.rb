require File.expand_path(File.dirname(__FILE__) + '/../name_index')

describe NameIndex do
  specify {
    expect(NameIndex.create_index(['キシモト', 'イトウ']))
      .to eq [ ['ア', ['イトウ']], ['カ', ['キシモト']] ]
  }

  # specify {
  #   expect(NameIndex.create_index(['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ']))
  #     .to eq[ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']], ['ハ', ['ハマダ', 'ババ']], ['ワ', ['ワダ']] ]
  # }
end



describe NameValue do

  describe "濁点付き" do
    skip
  end
end



describe Dictionary do

  describe ""
end
