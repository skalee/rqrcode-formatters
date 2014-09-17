module RQRCode
  module Formatters
    class Base

      attr_reader :options, :qr

      def initialize qr, options = {}
        @qr = qr
        @options = options
      end

      def render
        qr.modules.each do |row|
          concat row_start
          row.each do |cell|
            concat square cell
          end
          concat row_end
        end
        post_process
      end

    protected

      def row_start
        ""
      end

      def row_end
        ""
      end

      def square is_dark
        ""
      end

      def buffer
        @buffer ||= ""
      end

      def concat part
        buffer << part
      end

      def post_process
      end

    end
  end
end
