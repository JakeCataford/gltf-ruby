RSpec.describe GLTF do
  it "has a version number" do
    expect(GLTF::VERSION).not_to be nil
  end

  context "when building a gltf file with valid input" do
    before(:each) do
      @gltf = GLTF.new
      @valid_input = {
        asset: {
          version: "2.0",
          minVersion: "2.0",
          generator: "rubygltf",
          otherMetadata: "othermetadata",
        },
      }
    end

    it "can set asset version" do
      asset = { version: "2.0" }
      @gltf.asset = asset
      expect(@gltf.asset).to(eq(asset))
    end

    it "can set asset minversion (optional)" do
      asset = { version: "2.0" , minversion: "2.0" }
      @gltf.asset = asset
      expect(@gltf.asset).to(eq(asset))
    end

    it "can set asset optional metadata" do
      asset = { version: "2.0" , generator: "gltf-ruby" }
      @gltf.asset = asset
      expect(@gltf.asset).to(eq(asset))
    end
  end
end
