/* STEP 3-1 , 3-2 
   よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
   よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
 */
SELECT
    db_itv.tbl_program_basic.title
    , db_itv.tbl_program_basic.synopsis
    , db_itv.tbl_program_ep.ep_title
    , Count(db_itv.tbl_viewinghistory.account_id) AS views
    , db_itv.tbl_program_ep.season_num
    , db_itv.tbl_program_ep.epsode_num 
FROM
    db_itv.tbl_viewinghistory 
    INNER JOIN db_itv.tbl_programlist 
        ON db_itv.tbl_programlist.programlist_id = db_itv.tbl_viewinghistory.programlist_id 
    INNER JOIN db_itv.tbl_channel_master 
        ON db_itv.tbl_channel_master.channel_id = db_itv.tbl_programlist.channel_id 
    INNER JOIN db_itv.tbl_program_ep 
        ON db_itv.tbl_program_ep.program_ep_id = db_itv.tbl_programlist.program_ep_id 
    INNER JOIN db_itv.tbl_program_basic 
        ON db_itv.tbl_program_basic.program_basic_id = db_itv.tbl_program_ep.program_basic_id 
GROUP BY
    db_itv.tbl_program_basic.title
    , db_itv.tbl_program_basic.synopsis
    , db_itv.tbl_program_ep.ep_title
    , db_itv.tbl_viewinghistory.programlist_id
    , db_itv.tbl_program_ep.season_num
    , db_itv.tbl_program_ep.epsode_num 
ORDER BY
    views DESC 
LIMIT
    3
;
