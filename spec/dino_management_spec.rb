require_relative "../dino_management"

RSpec.describe DinoManagement do
  let(:dinos) do
    [
      {
        "name" => "DinoA",
        "category" => "herbivore",
        "period" => "Cretaceous",
        "diet" => "plants",
        "age" => 100
      },
      {
        "name" => "DinoB",
        "category" => "carnivore",
        "period" => "Jurassic",
        "diet" => "meat",
        "age" => 80
      }
    ]
  end

  subject(:result) { described_class.run(dinos) }

  describe ".run" do
    it "calculates health" do
      expect(result[:dinos][0]["health"]).to eq(0)
      expect(result[:dinos][1]["health"]).to eq(20)
    end

    it "assigns comments" do
      expect(result[:dinos][0]["comment"]).to eq("Dead")
      expect(result[:dinos][1]["comment"]).to eq("Alive")
    end

    it "calculates age metrics" do
      expect(result[:dinos][0]["age_metrics"]).to eq(0)
      expect(result[:dinos][1]["age_metrics"]).to eq(40)
    end

    it "returns a category summary" do
      expect(result[:summary]).to eq(
        "herbivore" => 1,
        "carnivore" => 1
      )
    end

    it "does not mutate the original input" do
      described_class.run(dinos)

      expect(dinos.first).not_to have_key("health")
      expect(dinos.first).not_to have_key("comment")
      expect(dinos.first).not_to have_key("age_metrics")
    end

    context "when a dinosaur has the wrong diet" do
      let(:dinos) do
        [
          {
            "name" => "Bad Dino",
            "category" => "herbivore",
            "diet" => "meat",
            "age" => 20
          }
        ]
      end

      it "penalizes health" do
        expect(result[:dinos].first["health"]).to eq(40)
      end
    end

    context "when age is zero or negative" do
      let(:dinos) do
        [
          {
            "name" => "Baby",
            "category" => "herbivore",
            "diet" => "plants",
            "age" => 0
          }
        ]
      end

      it "marks the dinosaur as dead" do
        expect(result[:dinos].first["health"]).to eq(0)
        expect(result[:dinos].first["comment"]).to eq("Dead")
      end
    end

    context "when there are no dinosaurs" do
      let(:dinos) { [] }

      it "returns an empty result" do
        expect(result).to eq(
          dinos: [],
          summary: {}
        )
      end
    end
  end
end