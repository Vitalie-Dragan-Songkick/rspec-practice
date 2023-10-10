require './concert'

describe 'Concert' do

  let(:valid_concert)   { Concert.new(['artist1',  'artist2'], 100, '2023/11/11', 'concert') }
  let(:invalid_concert) { Concert.new([], 100, '2023/11/11', 'concert') }
  


  describe "#Validation" do

    context "And there are artists present" do
      it 'should return true' do
        expect(valid_concert.valid?).to eq(true)
      end
    end

    context "And there are no artists present" do
      it 'should return false' do
        expect(invalid_concert.valid?).to eq(false)
      end
    end
  end

  describe '#Popularity' do

    context 'when the attendees > 1000' do
      before {allow(valid_concert).to receive(:attendees).and_return(1001) }

      it 'should return high' do
        expect(valid_concert.popularity).to eq('popular')
      end
    end

    context 'when the attendees > 500 < 1000' do
      before {allow(valid_concert).to receive(:attendees).and_return(501) }

      it 'should return medium' do
        expect(valid_concert.popularity).to eq('medium')
      end
    end

    context 'when the attendees < 500' do
      before {allow(valid_concert).to receive(:attendees).and_return(400) }

      it 'should return low' do
        expect(valid_concert.popularity).to eq('low')
      end
    end
  end


  
end
