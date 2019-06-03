describe "SerpApi Desktop JSON" do

  describe "Raw Submodules for Bing Knowledge Graph" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=george+washington&source=test&engine=bing'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains knowledge_graph array" do
      expect(@json["knowledge_graph"]).to be_an(Array)
    end

    describe "have first result" do
      before :all do
        @result = @json["knowledge_graph"][0]
      end

      it "has the correct type" do
        expect(@result["type"]).to eql("FamousGenericPeople")
      end

      it "has raw submodules" do
        expect(@result["raw_submodules"]).to be_an(Array)
        expect(@result["raw_submodules"].length).to be >= 1
      end
    end

  end

end
