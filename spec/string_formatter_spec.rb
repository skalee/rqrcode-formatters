require "spec_helper"

describe RQRCode::Formatters::String do

  let(:qr){ RQRCode::QRCode.new message }
  let(:message){ "Merely this and nothing more." }

  example "with default options it works like RQRCode#to_s" do
    options = {}
    go(options).should == qr.to_s
  end

  def go options
    described_class.new(qr, options).render
  end

end
