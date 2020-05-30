require 'spec_helper'

describe Repository do
  subject(:repository) { described_class.new db }
  let(:db) { {a: 1, b: 2} }

  describe "#store" do
    it "saves the new key and value to its database" do
      expect { repository.store :c, 3 }.to change { db }.to a: 1, b: 2, c: 3
    end

    it "overwrites the previously stored value" do
      expect { repository.store :a, 3 }.to change { db }.to a: 3, b: 2
    end
  end

  describe "#fetch" do
    it "returns the stored value" do
      expect(repository.fetch :a).to eq 1
      expect(repository.fetch :b).to eq 2
    end

    it "returns nil if stored value not found" do
      expect(repository.fetch :z).to eq nil
    end
  end

  describe "#delete" do
    it "removes the key from the database" do
      expect { repository.delete :b }.to change { db }.to a: 1
    end

    it "does nothing if the key is not in the database" do
      expect { repository.delete :z }.not_to change { db }
    end
  end
end