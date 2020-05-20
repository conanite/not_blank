RSpec.describe NotBlank do
  it "has a version number" do
    expect(NotBlank::VERSION).not_to be nil
  end

  it "returns nil for false" do
    expect(false.nb).to eq nil
  end

  it "returns nil for empty array" do
    expect([].nb).to eq nil
  end

  it "returns nil for blank string" do
    expect("".nb).to eq nil
    expect(" ".nb).to eq nil
    expect("\n".nb).to eq nil
  end

  it "returns nil for array containing only blank objects" do
    expect(["", " ", [[], [], "", { }], [false]].nb).to eq nil
  end

  it "returns non-blank elements of an array" do
    expect(["", :a, " ", [[], :b, [], "", { c: :d }], [false, true]].nb).to eq [:a, [:b, {:c=>:d}], [true]]
  end

  it "returns nil for hash containing only blank values" do
    h = { a: [], b: "", c: " ", d: { }, e: false, f: [[],[[],[]]], g: [false,false,false] }
    expect(h.nb).to eq nil
  end

  it "returns non-blank subset of hash containing some blank values" do
    h = { a: [], b: "", c: " ", d: { }, e: false, f: [[],[[],[]]], g: [false,false,false] }
    expect(h.nb).to eq nil
  end
end
