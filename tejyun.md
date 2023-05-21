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
   まず、``` mysql> SHOW COLUMNS FROM テーブル名 ```　と入力して、対象のテーブルの列情報を表示させておく。   
   次に列のデータ型や制約を見ながら、INSERT文で、データを入れていきます。
  ``` 
      INSERT INTO `テーブル名`   
          (`certification_id`,`pass_string`,`reg_date`)
      VALUES
          (1,'xsakldjsdlkdjal','2023/05/21'),
          (2,'gfgfgfgfgdggggd','2023/05/21'),
          (3,'rhrhrhrhrryjjhh','2023/05/21'),
          (4,'dddffhhhththhtl','2023/05/21'),
                            ・
                            ・
                            ・  
```  
　　作業順1　テーブル名 tbl_certification  
　　作業順2　テーブル名 tbl_user_info  
　　作業順3　テーブル名 tbl_account  
　　作業順4　テーブル名 tbl_janle   
　　作業順5　テーブル名 tbl_channel_master    
　　作業順6　テーブル名 tbl_program_basic     
　　作業順7　テーブル名 tbl_program_ep      
　　作業順8　テーブル名 tbl_programlist     
　　作業順9　テーブル名 tbl_viewinghistory      

＜参考＞  
create_tbls2.sqlの中身  
```  
