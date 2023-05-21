## 作業手順書
＜作業の概要＞テーブルの定義に従って、テーブルを作成し、それぞれのテーブルにサンプルデータを格納していく手順書です。  

＜作業前準備＞   
１）DBの管理者へ、DBへアクセスするためのログインユーザー名とパスワードを確認してください。  
２）ターミナルを立ち上げて、mysqlへログインしてください。  
３）今回作業するデータベースを指定します。　　入力例：　``` mysql> USE db_itv; ```  
  
＜作業手順＞  
１）まず、テーブルを一括作成するクエリを実行します。入力例のとおり、SQLのファイルを指定して実行します。  
　　入力例　``` mysql> SOURCE create_tbls2.sql; ```  
  
２）テーブルの作成実行したら、以下の順番に沿って、データを入れていきます。  