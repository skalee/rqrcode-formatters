module RQRCode
  module Formatters

    # Think of RQRCode::to_s on steroids.
    class String < Base

      def square is_dark
        is_dark ? "x" : " "
      end

      def row_end
        "\n"
      end

      def post_process
        buffer.chomp!
      end

    end
  end
end
