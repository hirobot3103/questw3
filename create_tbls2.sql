/*   

 INTERNET TV 用テーブルの作成

*/

/* アカウントに紐づいたパスワードを保管するテーブル */
CREATE TABLE IF NOT EXISTS `tbl_certification` (

  PRIMARY KEY (`certification_id`), 
  `certification_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'パスワード情報id　',
  `pass_string`      TEXT                NOT NULL                COMMENT 'パスワード(暗号化済み)',
  `reg_date`         DATE                NOT NULL                COMMENT '登録日'
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='アカウントに紐づいたパスワードを格納';

/* アカウントの詳細情報 */
CREATE TABLE  IF NOT EXISTS `tbl_user_info` (

  PRIMARY KEY (`user_info_id`),
  `user_info_id`      BIGINT(20)   UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '明細情報id' , 
  `first_name`        VARCHAR(30)           NOT NULL                COMMENT '名前' , 
  `last_name`         VARCHAR(30)           NOT NULL                COMMENT '名字' , 
  `gender`            ENUM('M','F')         NOT NULL                COMMENT '性別' , 
  `address_post`      CHAR(7)               NOT NULL                COMMENT '郵便番号ハイフンなし' , 
  `address_residence` TEXT                  NOT NULL                COMMENT '住所' , 
  `tel_num`           VARCHAR(12)           NOT NULL                COMMENT '電話番号ハイフンなし' , 
  `birth_date`        DATE                  NOT NULL                COMMENT '誕生日'
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='アカウントの詳細情報';

/* アカウントの情報 */
CREATE TABLE  IF NOT EXISTS `tbl_account` (

  PRIMARY KEY (`account_id`),
  `account_id`       BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id　', 
  `uer_info_id`      BIGINT(20) UNSIGNED NOT NULL                COMMENT '明細情報id　', 
  `certification_id` BIGINT(20) UNSIGNED NOT NULL                COMMENT 'パスワード情報id　', 
  `account_name`     VARCHAR(20)         UNIQUE                  COMMENT 'アカウント名　', 
  `email`            VARCHAR(100)        UNIQUE                  COMMENT 'メールアドレス　', 
  `reg_date`         DATE                NOT NULL                COMMENT '登録日　',
  
  FOREIGN KEY (`certification_id`) 
      REFERENCES `tbl_certification`(`certification_id`) 
              ON DELETE RESTRICT 
              ON UPDATE CASCADE,

  FOREIGN KEY (`uer_info_id`)      
      REFERENCES `tbl_user_info`(`user_info_id`)
              ON DELETE RESTRICT 
              ON UPDATE CASCADE
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='アカウント情報';

/* ジャンル情報 */  
CREATE TABLE IF NOT EXISTS `tbl_janle` (
  PRIMARY KEY (`janle_id`),
  `janle_id`   BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ジャンルid' , 
  `janle_name` VARCHAR(50)          UNIQUE                  COMMENT 'ジャンル名'
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ジャンル情報';

/* チャンネル情報 */  
CREATE TABLE IF NOT EXISTS `tbl_channel_master` (
  PRIMARY KEY (`channel_id`), 
  `channel_id`          BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'チャンネルid' , 
  `channel_name`        VARCHAR(50)          UNIQUE                  COMMENT 'チャンネル名' , 
  `channel_explanation` TEXT                 NOT NULL                COMMENT 'チャンネルの説明'
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='チャンネル情報';


/* 番組基本情報 */  
CREATE TABLE IF NOT EXISTS `tbl_program_basic` (
  PRIMARY KEY (`program_basic_id`), 
  `program_basic_id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '番組id' , 
  `title`            VARCHAR(50)          UNIQUE                  COMMENT '番組名' , 
  `synopsis`         TEXT                 NOT NULL                COMMENT '番組概要、あらすじ'
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='番組基本情報';


/* 番組エピソード情報 */  
CREATE TABLE IF NOT EXISTS `tbl_program_ep` (
 
  PRIMARY KEY (`program_ep_id`), 
  `program_ep_id`    BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT     COMMENT 'エピソードid', 
  `program_basic_id` BIGINT(20)  UNSIGNED NOT NULL                    COMMENT '番組id', 
  `janle_id`         BIGINT(20)  UNSIGNED NOT NULL                    COMMENT 'ジャンルid', 
  `season_num`       SMALLINT(5) UNSIGNED NOT NULL DEFAULT '1'        COMMENT 'シーズン数', 
  `epsode_num`       SMALLINT(5) UNSIGNED NOT NULL DEFAULT '1'        COMMENT 'エピソード数', 
  `ep_title`         VARCHAR(50)          NOT NULL                    COMMENT 'エピソードタイトル', 
  `ep_synopsis`      TEXT                 NOT NULL                    COMMENT 'あらすじ', 
  `ep_time`          TIME                 NOT NULL DEFAULT '01:00:00' COMMENT '動画時間',
  
  FOREIGN KEY (`program_basic_id`) 
      REFERENCES `tbl_program_basic`(`program_basic_id`) 
          ON DELETE RESTRICT 
          ON UPDATE CASCADE,
  
  FOREIGN KEY (`janle_id`)         
      REFERENCES `tbl_janle`(`janle_id`)                 
          ON DELETE RESTRICT 
          ON UPDATE CASCADE
    
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='番組基本情報';


/* 番組枠情報 */  
CREATE TABLE IF NOT EXISTS `tbl_programlist` (
 
  PRIMARY KEY (`programlist_id`), 
  `programlist_id` BIGINT(20)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '番組枠 id', 
  `channel_id`     BIGINT(20)  UNSIGNED NOT NULL                COMMENT 'チャンネルid', 
  `program_ep_id`  BIGINT(20)  UNSIGNED NOT NULL                COMMENT 'エピソードid', 
  `date_onair`     DATE                 NOT NULL                COMMENT '番組枠（放送日）', 
  `start_time`     TIME                 NOT NULL                COMMENT '番組枠（開始時間）',
  `end_time`       TIME                 NOT NULL                COMMENT '番組枠（終了時間）',
  
  FOREIGN KEY (`channel_id`)    
      REFERENCES `tbl_channel_master`(`channel_id`) 
          ON DELETE RESTRICT 
          ON UPDATE CASCADE,

  FOREIGN KEY (`program_ep_id`) 
      REFERENCES `tbl_program_ep`(`program_ep_id`)  
          ON DELETE RESTRICT 
          ON UPDATE CASCADE
    
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='番組枠情報';

  
/* 視聴履歴情報 */  
CREATE TABLE IF NOT EXISTS `tbl_viewinghistory` (
 
  PRIMARY KEY (`viewinghistory_id`), 
  `viewinghistory_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '視聴履歴id', 
  `account_id`        BIGINT(20) UNSIGNED NOT NULL                COMMENT '視聴者(アカウント)id', 
  `programlist_id`    BIGINT(20) UNSIGNED NOT NULL                COMMENT '番組枠 id',
  `date_viewing`      DATE                NOT NULL                COMMENT '視聴日', 
  
  INDEX (`date_viewing`),
  FOREIGN KEY (`account_id`)     
      REFERENCES `tbl_account`(`account_id`)          
          ON DELETE RESTRICT 
          ON UPDATE CASCADE,
  
  FOREIGN KEY (`programlist_id`) 
      REFERENCES `tbl_programlist`(`programlist_id`)  
          ON DELETE RESTRICT 
          ON UPDATE CASCADE
    
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='視聴履歴情報';
