/* STEP 3-4
ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、
本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、
エピソードタイトル、エピソード詳細を本日から一週間分取得してください
*/
SELECT
    db_itv.tbl_programlist.date_onair
    , db_itv.tbl_programlist.start_time
    , db_itv.tbl_programlist.end_time 
    , db_itv.tbl_programlist.channel_id
    , db_itv.tbl_channel_master.channel_name
    , db_itv.tbl_program_ep.season_num
    , db_itv.tbl_program_ep.epsode_num
    , db_itv.tbl_program_ep.ep_title
    , db_itv.tbl_program_ep.ep_synopsis

    
FROM
    db_itv.tbl_programlist 
    INNER JOIN db_itv.tbl_channel_master 
        ON db_itv.tbl_channel_master.channel_id = db_itv.tbl_programlist.channel_id 
    INNER JOIN db_itv.tbl_program_ep 
        ON db_itv.tbl_program_ep.program_ep_id = db_itv.tbl_programlist.program_ep_id

HAVING
     db_itv.tbl_programlist.channel_id = 1
     AND db_itv.tbl_programlist.date_onair 
         BETWEEN '2023/05/21' 
             AND '2023/05/28'

ORDER BY
     db_itv.tbl_programlist.date_onair, 
     db_itv.tbl_programlist.channel_id
;
