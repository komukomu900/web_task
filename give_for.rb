# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new
# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"give_for"のデータを cgi['give_for']と言う記述で取り出し、ローカル変数に代入する
  get = cgi['give_for']
  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>ゴーヤの譲渡先は以下になります。</p>
      結果：#{get}
    </body>
  </html>"
}
