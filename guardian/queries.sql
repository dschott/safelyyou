use sy_tenant4
select * from sy_residences -- 87
select * from sy_residence_units where residence_id = 87 -- 192
select * from sy_local_units where residence_id = 87 -- 217
select * from sy_sensors



87


SELECT DISTINCT
	`sy_entity`.`id`, `sy_entity`.`polymorphic_ctype_id`, `sy_entity`.`secret`, `sy_entity`.`identifier`, `sy_entity`.`date_joined`, `sy_entity`.`last_login`,
	`sy_entity`.`is_active`, `sy_local_units`.`nsentity_ptr_id`, `sy_local_units`.`hostname`, 
`sy_local_units`.`ip_address`, `sy_local_units`.`version`, `sy_local_units`.`residence_id`, 
`sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`, `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, 
`sy_residences`.`to_keep_post_fall`, `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`, `sy_residences`.`kibana_url`, 
`sy_residences`.`country`, `sy_residences`.`onesource_enabled`, `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`,
 `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`, `sy_residences`.`is_active` 
FROM `sy_local_units` 
INNER JOIN `sy_residences` 
	ON (`sy_local_units`.`residence_id` = `sy_residences`.`id`) 
INNER JOIN `sy_entity`
	ON (`sy_local_units`.`nsentity_ptr_id` = `sy_entity`.`id`) 
WHERE (`sy_local_units`.`residence_id` = 87
AND `sy_entity`.`is_active` = 1) 
ORDER BY `sy_entity`.`identifier` 
ASC LIMIT 3




SELECT COUNT(*)
FROM (
	SELECT `sy_sensors`.`id` AS Col1,
    (
        SELECT U2.`name` 
        FROM `sy_sensors_history` U0
        LEFT OUTER JOIN `sy_rooms` U2 
			ON (U0.`room_id` = U2.`id`) 
		WHERE (U0.`sensor_id` = (`sy_sensors`.`id`) 
        AND U0.`end` IS NULL) 
        ORDER BY U0.`start` DESC
	) AS `room_name`, 
    (
		SELECT U2.`name` 
        FROM `sy_sensors_assignations` U0 
        LEFT OUTER JOIN `sy_residences` U2 
			ON (U0.`residence_id` = U2.`id`) 
		WHERE (U0.`sensor_id` = (`sy_sensors`.`id`)
        AND U0.`end` IS NULL) 
        ORDER BY U0.`start` DESC)
	AS `residence_name`
	FROM `sy_sensors` 
	WHERE (`sy_sensors`.`id` IN (
			SELECT U0.`sensor_id` AS Col1 
			FROM `sy_sensors_assignations` U0 
			WHERE (U0.`residence_id` = 87 
			AND U0.`end` IS NULL)
		) AND `sy_sensors`.`is_active` = 1
	) 
	GROUP BY `sy_sensors`.`id` ORDER BY NULL
) subquery





select * from sy_sensors_assignations