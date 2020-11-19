# webrick呼び出し
require 'webrick'
# webrickインスタンスの生成
server = WEBrick::HTTPServer.new({
  # 以下３つの値はwebrick利用時に設定の必要がある
  # ドメイン設定
  :DocumentRoot => '/',
  # このプログラムの実行するプログラムの指定
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  # ポート番号指定
  :Port => '3000',
})
# ?
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
# webサーバ起動時にリクエスト受信時に表示するファイルを指定する。
# 今回はこのファイルと同じ階層のファイルを指定している。
# 指定するURLは上記のドメイン名と合わせて / となる。
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'task.html.erb')
#  指定するURLは上記のドメイン名と合わせて ./test となる。
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
# cgiについて記載のあるファイルの指定
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
# cgiについて記載のあるファイルの記載
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
# 自家消費以外の譲渡先を表示するファイルの記載
server.mount('/give_for.cgi', WEBrick::HTTPServlet::CGIHandler, 'give_for.rb')
# 品質が悪いゴーヤを表示するファイルの記載
server.mount('/bad_goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'bad_goya.rb')
# startだからwebサーバーとして機能する様になる？
server.start
