require "spec_helper"

describe RQRCode::Formatters::HtmlTable do

  let(:qr){ RQRCode::QRCode.new message }
  let(:message){ "Merely this and nothing more." }

  example "with default options it creates a HTML table with minimal styling" do
    options = {}
    dom = Nokogiri::HTML::DocumentFragment.parse go(options)

    dom.children.count.should == 1
    dom.children[0].name.should == "table"
    dom.children[0][:class].should == "qr"

    rows = dom.xpath(".//tr").count
    cells = dom.xpath(".//td").count
    rows.should > 0
    cells.should == rows ** 2

    td_styles = dom.xpath(".//td").map{ |td| td[:style] }
    td_colors = td_styles.map{ |s| /background-color: ([^;]*);/.match(s)[1] }

    td_colors.to_set.should == %w[#fff #000].to_set
  end

  def go options
    described_class.new(qr, options).render
  end

end
