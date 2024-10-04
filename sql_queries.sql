ALTER TABLE `tblbim360users` 
ADD COLUMN `role` VARCHAR(100) NULL AFTER `bim360_id`,
ADD COLUMN `status` VARCHAR(45) NULL DEFAULT 'active' AFTER `role`,
ADD COLUMN `company_id` VARCHAR(45) NULL AFTER `status`,
ADD COLUMN `default_role_id` VARCHAR(45) NULL AFTER `company_id`,
ADD COLUMN `bim_object` TEXT NULL AFTER `default_role_id`,
ADD COLUMN `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP AFTER `bim_object`,
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_at`;


ALTER TABLE `tblprojecttypehistory` 
CHANGE COLUMN `typedate` `typedate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ;


INSERT INTO `tblbimdocsprojecttypes` (`project_type_id`, `project_type_name`) VALUES ('8', 'riser_packages');

ALTER TABLE `tblbimdocsprojecttypes` 
CHANGE COLUMN `project_type_id` `bim_docs_project_type_id` INT(11) NOT NULL AUTO_INCREMENT ;


CREATE TABLE `tblbimdocsprojecttypes_relation` (
  `bimdocsprojecttypes_relation_id` int NOT NULL AUTO_INCREMENT,
  `bim_doc_proj_type_id` int NOT NULL,
  `project_type_id` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `market_id` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_kkto_project` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bimdocsprojecttypes_relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (1,5,'10',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (2,5,'14',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (3,2,'6','5',NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (4,6,'6',NULL,'1');
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (5,3,'6',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (6,7,'9',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (7,6,'11',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (8,1,'7','5',NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (9,4,'7',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (10,2,'1','5',NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (11,3,'1',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (12,6,'1',NULL,'1');
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (13,2,'2','5',NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (14,3,'2',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (15,6,'2',NULL,'1');
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (16,2,'3','5',NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (17,3,'3',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (18,6,'3',NULL,'1');
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (19,8,'19',NULL,NULL);
INSERT INTO `tblbimdocsprojecttypes_relation` (`bimdocsprojecttypes_relation_id`,`bim_doc_proj_type_id`,`project_type_id`,`market_id`,`is_kkto_project`) VALUES (20,5,'13',NULL,NULL);



CREATE TABLE `tblbim360usergroups` (
  `group_id` INT NOT NULL AUTO_INCREMENT,
  `group_name` VARCHAR(45) NULL,
  `active` TINYINT(4) NULL DEFAULT 1,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`));

INSERT INTO `tblbim360usergroups` (`group_name`, `active`) VALUES ('add_to_all_projects', '1');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('estimators');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('oil_and_gas_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('drawing_fab_craft_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('koil_kit_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('riser_packages');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('vis_vcp_vtfr_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('emeai_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('canada_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('latam_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('asia_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('canada_drawing_admins');
INSERT INTO `tblbim360usergroups` (`group_name`) VALUES ('us_aust_risers_admins');



CREATE TABLE `tblbimprojecttype_group_mapping` (
  `bim_doc_project_type_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bim_doc_project_type_id`, `group_id`));

INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('1', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('2', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('3', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('4', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('5', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('6', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('7', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('8', '1');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('1', '3');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('2', '3');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('7', '3');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('3', '4');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('4', '4');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('8', '6');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('5', '7');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('6', '5');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('3', '2');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('4', '2');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('8', '2');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('5', '2');
INSERT INTO `tblbimprojecttype_group_mapping` (`bim_doc_project_type_id`, `group_id`) VALUES ('6', '2');


CREATE TABLE `tblbimusergroup_mapping` (
  `group_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (1,242,'2023-12-11 13:09:26','2023-12-11 13:09:26');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (1,266,'2023-12-11 12:40:29','2023-12-11 12:40:29');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (2,35,'2023-12-11 16:47:32','2023-12-11 16:47:32');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (2,51,'2023-12-11 16:47:32','2023-12-11 16:47:32');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (2,94,'2023-12-11 16:47:32','2023-12-11 16:47:32');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (2,117,'2023-12-11 16:47:32','2023-12-11 16:47:32');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (2,192,'2023-12-11 16:47:32','2023-12-11 16:47:32');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (2,283,'2023-12-11 16:47:32','2023-12-11 16:47:32');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,18,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,98,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,107,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,111,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,115,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,116,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,117,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,135,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,156,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,190,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,211,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (3,261,'2023-12-11 16:51:47','2023-12-11 16:51:47');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,18,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,21,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,61,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,63,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,107,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,111,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,115,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,135,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (4,190,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,18,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,21,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,61,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,63,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,107,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,111,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,115,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,135,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,145,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (5,190,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (6,18,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (6,107,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (6,111,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (6,115,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (6,135,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (6,190,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (7,18,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (7,28,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (7,115,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (7,135,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (7,190,'2023-12-11 17:02:03','2023-12-11 17:02:03');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (8,20,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (8,58,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (8,64,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (8,65,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (8,128,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (9,119,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (9,122,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (10,193,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (11,240,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (12,124,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (12,126,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (12,189,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (13,93,'2023-12-12 09:26:19','2023-12-12 09:26:19');
INSERT INTO tblbimusergroup_mapping (`group_id`,`user_id`,`created_at`,`updated_at`) VALUES (13,242,'2023-12-12 09:26:19','2023-12-12 09:26:19');


CREATE TABLE `tblbimregion_group_mapping` (
  `region_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`region_id`, `group_id`));

INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('1', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('2', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('3', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('4', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('5', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('7', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('8', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('1', '11');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('3', '9');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('4', '8');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('5', '8');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`) VALUES ('7', '10');


CREATE TABLE `tblbimregion_projecttype_group_mapping` (
  `region_id` INT NOT NULL,
  `bim_doc_project_type_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`region_id`, `bim_doc_project_type_id`, `group_id`));


INSERT INTO `tblbimregion_projecttype_group_mapping` (`region_id`, `bim_doc_project_type_id`, `group_id`) VALUES ('3', '4', '12');
INSERT INTO `tblbimregion_projecttype_group_mapping` (`region_id`, `bim_doc_project_type_id`, `group_id`) VALUES ('8', '8', '13');
INSERT INTO `tblbimregion_projecttype_group_mapping` (`region_id`, `bim_doc_project_type_id`, `group_id`) VALUES ('2', '8', '13');



ALTER TABLE `tblbimdocsprojects` 
ADD COLUMN `autoDeskRequest` TEXT NULL AFTER `bim360_proj_id`,
ADD COLUMN `autoDeskResponse` TEXT NULL AFTER `autoDeskRequest`,
ADD COLUMN `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP AFTER `autoDeskResponse`,
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_at`;



ALTER TABLE `tblprojecttypes` 
ADD COLUMN `create_in_acc` TINYINT(4) NULL DEFAULT 0 AFTER `projtypesuffix`,
ADD COLUMN `create_folder_only` TINYINT(4) NULL DEFAULT 0 AFTER `create_in_acc`,
ADD COLUMN `acc_project_id` VARCHAR(45) NULL AFTER `create_folder_only`,
ADD COLUMN `acc_parent_folder_id` VARCHAR(45) NULL AFTER `acc_project_id`;


UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '1');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '2');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '3');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '4');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '6');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '7');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '8');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '9');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1', `create_folder_only` = '1', `acc_project_id` = 'b.a8f17536-123a-440a-b2e6-0c799d5839e6', `acc_parent_folder_id` = 'urn:adsk.wipprod:fs.folder:co.0E5GojwFRMKXJs-4NmNkmw' WHERE (`projtypeid` = '16');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1', `create_folder_only` = '1', `acc_project_id` = 'b.55ae85d8-5369-442e-8331-41f24257f1c4', `acc_parent_folder_id` = 'urn:adsk.wipprod:fs.folder:co.Oxxy1rwjTrurT2ilc18cLg' WHERE (`projtypeid` = '17');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1', `create_folder_only` = '1', `acc_project_id` = 'b.592968cc-c46b-45cb-93e4-e348bde0a1a2' WHERE (`projtypeid` = '18');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '19');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1', `create_folder_only` = '1', `acc_project_id` = 'b.66755436-d70e-43fa-be0b-278319a1d413' WHERE (`projtypeid` = '20');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1', `create_folder_only` = '1', `acc_project_id` = 'b.63ec046d-aa26-4547-82b7-8878e82797eb', `acc_parent_folder_id` = 'urn:adsk.wipprod:fs.folder:co.h1HZNks-Q-OKtHMWGCXu8g' WHERE (`projtypeid` = '21');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1', `create_folder_only` = '1', `acc_project_id` = 'b.63ec046d-aa26-4547-82b7-8878e82797eb', `acc_parent_folder_id` = 'urn:adsk.wipprod:fs.folder:co.aGft3yylQf6o0kqwVQEaDA' WHERE (`projtypeid` = '22');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '23');
UPDATE `tblprojecttypes` SET `create_in_acc` = '1' WHERE (`projtypeid` = '24');



ALTER TABLE `tblbimregion_group_mapping` 
ADD COLUMN `add_to_sold_only` TINYINT(4) NULL DEFAULT 0 AFTER `group_id`;


INSERT INTO `tblbim360usergroups` (`group_name`, `active`) VALUES ('australia_sold_admins', '1');
INSERT INTO `tblbim360usergroups` (`group_name`, `active`) VALUES ('emeai_sold_admins', '1');
INSERT INTO `tblbim360usergroups` (`group_name`, `active`) VALUES ('united_states_sold_admins', '1');
INSERT INTO `tblbim360usergroups` (`group_name`, `active`) VALUES ('latin_america_sold_admins', '1');


INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`, `add_to_sold_only`) VALUES ('2', '14', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`, `add_to_sold_only`) VALUES ('4', '15', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`, `add_to_sold_only`) VALUES ('7', '17', '1');
INSERT INTO `tblbimregion_group_mapping` (`region_id`, `group_id`, `add_to_sold_only`) VALUES ('8', '16', '1');



INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '20');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '21');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '55');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '58');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '61');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '93');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '107');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '111');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '140');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '166');



INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '93');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '140');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '166');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '21');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '61');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '107');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '111');


INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '93');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '55');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '140');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '166');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '191');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '21');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '61');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '107');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '111');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '93');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '55');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '140');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '166');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '21');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '61');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '107');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '111');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('14', '229');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('15', '229');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('16', '229');
INSERT INTO `tblbimusergroup_mapping` (`group_id`, `user_id`) VALUES ('17', '229');
