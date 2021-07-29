# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new
# [3]データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya3"のデータを cgi['goya3']と言う記述で取り出し、ローカル変数に代入する
  get3 = cgi['goya3']
  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>ゴーヤの品質の情報は下記になります</p>
      文字列：#{get3}
    </body>
  </html>"
}