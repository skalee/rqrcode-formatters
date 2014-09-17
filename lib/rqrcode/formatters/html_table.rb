module RQRCode
  module Formatters

    class HtmlTable < Base

      COMMON_FIELD_STYLE = "width: 3px; height: 3px; padding: 0; margin: 0;"
      DARK_FIELD_STYLE = "background-color: #000; #{COMMON_FIELD_STYLE}"
      LIGHT_FIELD_STYLE = "background-color: #fff; #{COMMON_FIELD_STYLE}"

      TABLE_STYLE = "border: 0 none; border-spacing: 0; border-collapse: collapse;"

      def square is_dark
        style = is_dark ? DARK_FIELD_STYLE : LIGHT_FIELD_STYLE
        %Q[<td style="#{style}"></td>]
      end

      def row_start
        "<tr>"
      end

      def row_end
        "</tr>"
      end

      def buffer
        @buffer ||= %Q[<table class="qr" style="#{TABLE_STYLE}"><tbody>]
      end

      def post_process
        concat "</tbody></table>"
        buffer.html_safe if @buffer.respond_to? :html_safe
        buffer
      end

    end
  end
end
