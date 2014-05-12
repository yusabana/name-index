require File.expand_path(File.dirname(__FILE__) + '/../name_index')

describe NameIndex do
  specify { expect(NameIndex.create_index('')).to eq [] }
end