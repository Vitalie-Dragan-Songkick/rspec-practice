require './concert'

describe 'Concert' do

  let(:valid_concert)   { Concert.new(['artist1',  'artist2'], 100, '2024/11/11', 'concert') }
  let(:invalid_concert) { Concert.new([], 100, '2023/01/01', 'jkhvkjh') }
  
  let(:concert)    { Concert.new(['ab', 'ac', 'ad', 'bcd'], 100, '2023/11/11', 'concert') }
  let(:livestream) { Concert.new(['ab', 'ac', 'ad', 'bcd'], 100, '2023/11/11', 'livestream') }
  let(:festival)   { Concert.new(['ab', 'ac', 'ad', 'bcd'], 100, '2023/11/11', 'festival') }

  # let(:valid_date)   { Concert.new(['artist1',  'artist2'], 100, Date.today + 1, 'concert') }
  # let(:invalid_date) { Concert.new(['artist1',  'artist2'], 100, Date.today - 1, 'concert') }
  let(:valid_date)   { Concert.new(['artist1',  'artist2'], 100, (Date.today + 1).to_s, 'concert') }
  let(:invalid_date) { Concert.new(['artist1',  'artist2'], 100, (Date.today - 1).to_s, 'concert') }
  




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

  
# My Code

  # type method 
  describe '#type' do
    context 'when type is concert' do
      it 'returns the event type' do
        expect(valid_concert.type).to eq('concert')
      end
    end



    context 'when type is livestream' do
      before{allow(valid_concert).to receive(:type).and_return('livestream')}
      it 'returns true' do
        
        expect(valid_concert.type_is_valid).to eq(true)
      end
    end
    context 'when type is festival' do
      before{allow(valid_concert).to receive(:type).and_return('festival')}
      it 'returns true' do
        expect(valid_concert.type_is_valid).to eq(true)
      end
    end
  end

  # type_is_valid method 
  describe 'type_is_valid' do
    context 'when type is neither concert nor livestream' do
      before{allow(invalid_concert).to receive(:type).and_return('comedy')}
      it 'returns false' do
        expect(invalid_concert.type_is_valid).to eq(false)
      end
    end
  end

  # headliners
  describe 'headliners' do
    context 'when concert or livestream' do
      it 'returns first artist in array' do
        expect(concert.headliners).to eq('ab')
        expect(livestream.headliners).to eq('ab')
      end
    end
    context 'when fetstival' do
      it 'returns entire array' do
        expect(festival.headliners).to eq(['ab', 'ac', 'ad', 'bcd'])
      end
    end
  end

  # satrt date
  describe '#date_in_future?' do
    context 'when start date is in the future' do
      it 'returns a date in future' do
        today = Date.today
        future_date = today + 1
        expect(valid_date.date_in_future?).to eq(true)
      end
    end
    context 'when start date is in the past' do
      it 'returns a date in future' do
        today = Date.today
        past_date = today - 1 
        expect(invalid_date.date_in_future?).to eq(false)
      end
    end
  end

  
end
