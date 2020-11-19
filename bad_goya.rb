# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new
# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"bad_goya"のデータを cgi['bad_goya']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['bad_goya']
  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>品質の悪いゴーヤが以下になります。</p>
      結果：#{get}
    </body>
  </html>"
}
