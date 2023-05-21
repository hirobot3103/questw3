/* STEP 3-3
本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
*/

SELECT
    db_itv.tbl_programlist.channel_id
    , db_itv.tbl_channel_master.channel_name
    , db_itv.tbl_programlist.date_onair
    , db_itv.tbl_program_ep.season_num
    , db_itv.tbl_program_ep.epsode_num
    , db_itv.tbl_program_ep.ep_title
    , db_itv.tbl_program_ep.ep_synopsis
    , db_itv.tbl_programlist.start_time
    , db_itv.tbl_programlist.end_time 
FROM
    db_itv.tbl_programlist 
    INNER JOIN db_itv.tbl_channel_master 
        ON db_itv.tbl_channel_master.channel_id = db_itv.tbl_programlist.channel_id 
    INNER JOIN db_itv.tbl_program_ep 
        ON db_itv.tbl_program_ep.program_ep_id = db_itv.tbl_programlist.program_ep_id

HAVING
     db_itv.tbl_programlist.date_onair = '2023/05/21'
     
ORDER BY 
     db_itv.tbl_programlist.channel_id, 
     db_itv.tbl_programlist.date_onair
;
