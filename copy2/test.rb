# ライブラリ「webrick」を呼び出している
require 'webrick'
# Webrickのインスタンスを作成し、serverという名前のローカル変数に入れる
# DocumentRoot：このWebアプリケーションのドメインの設定（ここに書き込まれた記述が、作成するWebアプリケーションのドメインになる）
# CGIInterpreter：このプログラムを実行（翻訳）できるプログラム（Rubyのこと）本体の居場所を指定する記述
# Port：このWebアプリケーションの情報の出入り口を表す設定
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
# Webサーバを起動した状態で、（DocumentRootの値）/testというURLを送信すると、同じディレクトリ階層にあるtest.html.erbファイルを表示する
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'new.html.erb')
# Webサーバを起動した状態で、（DocumentRootの値）/testというURLを送信すると、同じディレクトリ階層にあるtest.html.erbファイルを表示する
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
# <form action='indicate.cgi'> 〜 </form>の内部にある値を、indicate.rbに送信することができる
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler,'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.start