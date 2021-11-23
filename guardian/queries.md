# Queries


## Cookie from sky site

cookie="tzname=America/New_York; XCSRF-TOKEN=u8md82WhPhro7aHl0e6BgpIdhNfGRDCtgWSXCDwssqbPfUaTiRvvXFXmx4VHTStd; sessionid=1j6v66ae3jvw9elqpykj8l0aywbbg5rg"

## Guardians

```sh
curl -H "Cookie: ${cookie}" 'http://tenant4.discover.safely-you.local:8008/guardians?residence=87&format=json' | jq .
```

```sql
SELECT DISTINCT
    `sy_entity`.`id`, `sy_entity`.`polymorphic_ctype_id`, `sy_entity`.`secret`,
    `sy_entity`.`identifier`, `sy_entity`.`date_joined`, `sy_entity`.`last_login`,
    `sy_entity`.`is_active`, `sy_local_units`.`nsentity_ptr_id`, `sy_local_units`.`hostname`,
    `sy_local_units`.`ip_address`, `sy_local_units`.`version`, `sy_local_units`.`residence_id`,
    `sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`,
    `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, `sy_residences`.`to_keep_post_fall`,
    `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`,
    `sy_residences`.`kibana_url`, `sy_residences`.`country`, `sy_residences`.`onesource_enabled`,
    `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`,
    `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`,
    `sy_residences`.`is_active`
FROM `sy_local_units`
INNER JOIN `sy_residences`
    ON (`sy_local_units`.`residence_id` = `sy_residences`.`id`)
INNER JOIN `sy_entity`
    ON (`sy_local_units`.`nsentity_ptr_id` = `sy_entity`.`id`)
WHERE (`sy_local_units`.`residence_id` = 87
AND `sy_entity`.`is_active` = 1)
ORDER BY `sy_entity`.`identifier`
ASC LIMIT 3
```

## Guardians

```sh
curl -H "Cookie: ${cookie}" 'http://tenant4.discover.safely-you.local:8008/sensors?residence=87&format=json' | jq .
```

```sql
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
        ORDER BY U0.`start` DESC
    ) AS `residence_name`
    FROM `sy_sensors`
    WHERE (
        `sy_sensors`.`id` IN (
            SELECT U0.`sensor_id` AS Col1
            FROM `sy_sensors_assignations` U0
            WHERE (
                U0.`residence_id` = 87
                AND U0.`end` IS NULL
            )
        ) AND `sy_sensors`.`is_active` = 1
    )
    GROUP BY `sy_sensors`.`id` ORDER BY NULL
) subquery
```



```sql
SELECT DISTINCT
    `sy_sensors`.`id`, `sy_sensors`.`identifier`, `sy_sensors`.`type`, `sy_sensors`.`is_active`,
    `sy_sensors`.`is_safety_check_active`, `sy_sensors`.`hostname`, `sy_sensors`.`ip_address`,
    `sy_sensors`.`snapshot`, `sy_sensors`.`last_snapshot`, `sy_sensors`.`country`,
    `sy_sensors`.`fast_snapshot`, `sy_sensors`.`date_joined`, `sy_sensors`.`last_login`
FROM `sy_sensors`
INNER JOIN `sy_sensors_assignations`
    ON (`sy_sensors`.`id` = `sy_sensors_assignations`.`sensor_id`)
WHERE (`sy_sensors_assignations`.`residence_id` = 87 AND `sy_sensors_assignations`.`end` IS NULL)
ORDER BY `sy_sensors`.`id` ASC LIMIT 1001
```

```
http://tenant4.discoverui.safely-you.local:4201/facilities/87/rooms/133
```

```text
[03-Nov-2021 19:18:02.743] INFO [views.py:473]: GET /api/residents?limit=1000&prefetch=room_assignations__room,&residence=87 - 21 queries / 0.132000:

0.015 - SELECT DISTINCT `sy_residents`.`id`, `sy_residents`.`birth_date`, `sy_residents`.`undefined`, `sy_residents`.`consent_received`, `sy_residents`.`first_name`, `sy_residents`.`last_name`
FROM `sy_residents`
INNER JOIN `sy_residents_assignations` ON (`sy_residents`.`id` = `sy_residents_assignations`.`resident_id`)
WHERE `sy_residents_assignations`.`residence_id` = 87 ORDER BY `sy_residents`.`last_name` ASC LIMIT 1001

0.007 - SELECT `sy_rooms_occupancy`.`id`, `sy_rooms_occupancy`.`room_id`, `sy_rooms_occupancy`.`resident_id`, `sy_rooms_occupancy`.`start`, `sy_rooms_occupancy`.`end`, `sy_rooms_occupancy`.`resident_id` AS `_rel_id`
FROM `sy_rooms_occupancy`
WHERE `sy_rooms_occupancy`.`resident_id` IN (128)
ORDER BY `sy_rooms_occupancy`.`start` DESC

0.003 - SELECT `sy_rooms`.`id`, `sy_rooms`.`residence_id`, `sy_rooms`.`residence_unit_id`, `sy_rooms`.`name`, `sy_rooms`.`external_id`, `sy_rooms_occupancy`.`id` AS `_rel_id`
FROM `sy_rooms`
INNER JOIN `sy_rooms_occupancy`
ON (`sy_rooms`.`id` = `sy_rooms_occupancy`.`room_id`)
WHERE `sy_rooms_occupancy`.`id` IN (154)

0.003 - SELECT `sy_residents_assignations`.`id`, `sy_residents_assignations`.`residence_id`, `sy_residents_assignations`.`resident_id`, `sy_residents_assignations`.`start`, `sy_residents_assignations`.`end`, `sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`, `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, `sy_residences`.`to_keep_post_fall`, `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`, `sy_residences`.`kibana_url`, `sy_residences`.`country`, `sy_residences`.`onesource_enabled`, `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`, `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`, `sy_residences`.`is_active`
FROM `sy_residents_assignations`
LEFT OUTER JOIN `sy_residences` ON (`sy_residents_assignations`.`residence_id` = `sy_residences`.`id`)
WHERE `sy_residents_assignations`.`resident_id` IN (128)
ORDER BY `sy_residents_assignations`.`start` DESC

0.002 - SELECT `sy_rooms_occupancy`.`id`, `sy_rooms_occupancy`.`room_id`, `sy_rooms_occupancy`.`resident_id`, `sy_rooms_occupancy`.`start`, `sy_rooms_occupancy`.`end`, `sy_rooms`.`id`, `sy_rooms`.`residence_id`, `sy_rooms`.`residence_unit_id`, `sy_rooms`.`name`, `sy_rooms`.`external_id` FROM `sy_rooms_occupancy` LEFT OUTER JOIN `sy_rooms` ON (`sy_rooms_occupancy`.`room_id` = `sy_rooms`.`id`) WHERE (`sy_rooms_occupancy`.`end` IS NULL AND `sy_rooms_occupancy`.`resident_id` IN (128)) ORDER BY `sy_rooms_occupancy`.`start` DESC
0.004 - SELECT `sy_rooms_occupancy`.`id`, `sy_rooms_occupancy`.`room_id`, `sy_rooms_occupancy`.`resident_id`, `sy_rooms_occupancy`.`start`, `sy_rooms_occupancy`.`end`, `sy_rooms`.`id`, `sy_rooms`.`residence_id`, `sy_rooms`.`residence_unit_id`, `sy_rooms`.`name`, `sy_rooms`.`external_id` FROM `sy_rooms_occupancy` LEFT OUTER JOIN `sy_rooms` ON (`sy_rooms_occupancy`.`room_id` = `sy_rooms`.`id`) WHERE (`sy_rooms_occupancy`.`end` IS NULL AND `sy_rooms_occupancy`.`resident_id` = 128)
0.003 - SELECT `sy_residence_units`.`id`, `sy_residence_units`.`name`, `sy_residence_units`.`residence_id` FROM `sy_residence_units` WHERE `sy_residence_units`.`id` = 192
0.005 - SELECT `sy_residents`.`id`, `sy_residents`.`birth_date`, `sy_residents`.`undefined`, `sy_residents`.`consent_received`, `sy_residents`.`first_name`, `sy_residents`.`last_name` FROM `sy_residents` WHERE `sy_residents`.`id` = 128
0.003 - SELECT `sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`, `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, `sy_residences`.`to_keep_post_fall`, `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`, `sy_residences`.`kibana_url`, `sy_residences`.`country`, `sy_residences`.`onesource_enabled`, `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`, `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`, `sy_residences`.`is_active` FROM `sy_residences` WHERE `sy_residences`.`id` = 87
0.004 - SELECT `sy_residence_units`.`id`, `sy_residence_units`.`name`, `sy_residence_units`.`residence_id` FROM `sy_residence_units` WHERE `sy_residence_units`.`id` = 192
[03-Nov-2021 19:18:02.783] INFO [views.py:473]: GET /api/rooms/133?&prefetch=residence,residents_assignations__resident,sensors_assignations__sensor,sensors_assignations__rotations, - 15 queries / 0.095000:
0.009 - SELECT `ns_authtoken`.`id`, `ns_authtoken`.`created`, `ns_authtoken`.`key`, `ns_authtoken`.`user_id`, `ns_authtoken`.`origin` FROM `ns_authtoken` WHERE `ns_authtoken`.`key` = '0a650e6acd686325a34e853b84ed81655acf1b44'
0.009 - SELECT `sy_entity`.`id`, `sy_entity`.`polymorphic_ctype_id`, `sy_entity`.`secret`, `sy_entity`.`identifier`, `sy_entity`.`date_joined`, `sy_entity`.`last_login`, `sy_entity`.`is_active` FROM `sy_entity` WHERE `sy_entity`.`id` = 1
0.002 - SELECT `sy_entity`.`id`, `sy_entity`.`polymorphic_ctype_id`, `sy_entity`.`secret`, `sy_entity`.`identifier`, `sy_entity`.`date_joined`, `sy_entity`.`last_login`, `sy_entity`.`is_active`, `sy_users`.`nsentity_ptr_id`, `sy_users`.`email`, `sy_users`.`phone_number`, `sy_users`.`first_name`, `sy_users`.`last_name`, `sy_users`.`work_group_id` FROM `sy_users` INNER JOIN `sy_entity` ON (`sy_users`.`nsentity_ptr_id` = `sy_entity`.`id`) WHERE `sy_users`.`nsentity_ptr_id` IN (1)
0.002 - UPDATE `ns_authtoken` SET `created` = '2021-11-03 19:18:02.344486', `key` = '0a650e6acd686325a34e853b84ed81655acf1b44', `user_id` = 1, `origin` = 'SKY' WHERE `ns_authtoken`.`id` = 7899
0.024 - SELECT `auth_permission`.`id`, `auth_permission`.`name`, `auth_permission`.`content_type_id`, `auth_permission`.`codename` FROM `auth_permission` INNER JOIN `auth_group_permissions` ON (`auth_permission`.`id` = `auth_group_permissions`.`permission_id`) INNER JOIN `django_content_type` ON (`auth_permission`.`content_type_id` = `django_content_type`.`id`) WHERE `auth_group_permissions`.`group_id` IN (1, 2, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16, 17, 18, 19) ORDER BY `django_content_type`.`app_label` ASC, `django_content_type`.`model` ASC, `auth_permission`.`codename` ASC
0.020 - SELECT (1) AS `a` FROM `auth_permission` INNER JOIN `auth_group_permissions` ON (`auth_permission`.`id` = `auth_group_permissions`.`permission_id`) WHERE (`auth_group_permissions`.`group_id` IN (1, 2, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16, 17, 18, 19) AND `auth_permission`.`codename` = 'access_nssensorhistory') LIMIT 1
0.004 - SELECT (1) AS `a` FROM `auth_permission` INNER JOIN `auth_group_permissions` ON (`auth_permission`.`id` = `auth_group_permissions`.`permission_id`) WHERE (`auth_group_permissions`.`group_id` IN (1, 2, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16, 17, 18, 19) AND `auth_permission`.`codename` = 'access_nssensorrotations') LIMIT 1
0.008 - SELECT (1) AS `a` FROM `auth_permission` INNER JOIN `auth_group_permissions` ON (`auth_permission`.`id` = `auth_group_permissions`.`permission_id`) WHERE (`auth_group_permissions`.`group_id` IN (1, 2, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16, 17, 18, 19) AND `auth_permission`.`codename` = 'access_nssensor') LIMIT 1
0.003 - SELECT (1) AS `a` FROM `auth_permission` INNER JOIN `auth_group_permissions` ON (`auth_permission`.`id` = `auth_group_permissions`.`permission_id`) WHERE (`auth_group_permissions`.`group_id` IN (1, 2, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16, 17, 18, 19) AND `auth_permission`.`codename` = 'access_any_nsroom') LIMIT 1
0.004 - SELECT DISTINCT `sy_rooms`.`id`, `sy_rooms`.`residence_id`, `sy_rooms`.`residence_unit_id`, `sy_rooms`.`name`, `sy_rooms`.`external_id` FROM `sy_rooms` WHERE (`sy_rooms`.`id` = 133 AND `sy_rooms`.`id` = 133)
0.002 - SELECT `sy_rooms_occupancy`.`id`, `sy_rooms_occupancy`.`room_id`, `sy_rooms_occupancy`.`resident_id`, `sy_rooms_occupancy`.`start`, `sy_rooms_occupancy`.`end`, `sy_rooms_occupancy`.`room_id` AS `_rel_id` FROM `sy_rooms_occupancy` WHERE `sy_rooms_occupancy`.`room_id` IN (133) ORDER BY `sy_rooms_occupancy`.`start` DESC
0.002 - SELECT `sy_sensors_history`.`id`, `sy_sensors_history`.`room_id`, `sy_sensors_history`.`sensor_id`, `sy_sensors_history`.`start`, `sy_sensors_history`.`end`, `sy_sensors_history`.`room_id` AS `_rel_id` FROM `sy_sensors_history` WHERE `sy_sensors_history`.`room_id` IN (133) ORDER BY `sy_sensors_history`.`start` DESC
0.003 - SELECT `sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`, `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, `sy_residences`.`to_keep_post_fall`, `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`, `sy_residences`.`kibana_url`, `sy_residences`.`country`, `sy_residences`.`onesource_enabled`, `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`, `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`, `sy_residences`.`is_active` FROM `sy_residences` WHERE `sy_residences`.`id` = 87
0.001 - SELECT `sy_residence_units`.`id`, `sy_residence_units`.`name`, `sy_residence_units`.`residence_id` FROM `sy_residence_units` WHERE `sy_residence_units`.`id` = 192
0.002 - SELECT `sy_residents`.`id`, `sy_residents`.`birth_date`, `sy_residents`.`undefined`, `sy_residents`.`consent_received`, `sy_residents`.`first_name`, `sy_residents`.`last_name` FROM `sy_residents` WHERE `sy_residents`.`id` = 128
[03/Nov/2021 19:18:02] "GET /api/residents?limit=1000&prefetch=room_assignations__room,&residence=87 HTTP/1.1" 200 477
[03/Nov/2021 19:18:02] "GET /api/rooms/133?&prefetch=residence,residents_assignations__resident,sensors_assignations__sensor,sensors_assignations__rotations, HTTP/1.1" 200 269
```



## update_unit_state

```
sky-sky-local-1  | [03-Nov-2021 20:33:24.761] INFO [guardians.py:64]: Updated request from guardian
sky-sky-local-1  | [03-Nov-2021 20:33:24.775] INFO [guardians.py:171]: Searching for falls at residence "AAA" after 2021-11-02 20:33:24.761674+00:00
sky-sky-local-1  | [03-Nov-2021 20:33:24.792] INFO [views.py:473]: GET /api/guardians/updates?format=json - 14 queries / 0.027000:
sky-sky-local-1  |     0.003 - SELECT `sy_entity`.`id`, `sy_entity`.`polymorphic_ctype_id`, `sy_entity`.`secret`, `sy_entity`.`identifier`, `sy_entity`.`date_joined`, `sy_entity`.`last_login`, `sy_entity`.`is_active` FROM `sy_entity` WHERE `sy_entity`.`identifier` = '00:A1:00:00:00:00'
sky-sky-local-1  |     0.002 - SELECT `sy_entity`.`id`, `sy_entity`.`polymorphic_ctype_id`, `sy_entity`.`secret`, `sy_entity`.`identifier`, `sy_entity`.`date_joined`, `sy_entity`.`last_login`, `sy_entity`.`is_active`, `sy_local_units`.`nsentity_ptr_id`, `sy_local_units`.`hostname`, `sy_local_units`.`ip_address`, `sy_local_units`.`version`, `sy_local_units`.`residence_id` FROM `sy_local_units` INNER JOIN `sy_entity` ON (`sy_local_units`.`nsentity_ptr_id` = `sy_entity`.`id`) WHERE `sy_local_units`.`nsentity_ptr_id` IN (217)
sky-sky-local-1  |     0.002 - DELETE FROM `sy_auth_exceptions` WHERE `sy_auth_exceptions`.`expires_at` < '2021-11-03 20:33:24.710383'
sky-sky-local-1  |     0.002 - SELECT (1) AS `a` FROM `sy_auth_exceptions` WHERE (`sy_auth_exceptions`.`banned` = 1 AND `sy_auth_exceptions`.`entity_id` = 217) LIMIT 1
sky-sky-local-1  |     0.002 - SELECT `sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`, `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, `sy_residences`.`to_keep_post_fall`, `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`, `sy_residences`.`kibana_url`, `sy_residences`.`country`, `sy_residences`.`onesource_enabled`, `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`, `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`, `sy_residences`.`is_active` FROM `sy_residences` WHERE `sy_residences`.`id` = 87
sky-sky-local-1  |     0.002 - INSERT INTO `sy_records` (`entity_id`, `ip_address`, `action`, `success`, `timestamp`, `path`, `details`) VALUES (217, '172.16.238.1', 2, 1, '2021-11-03 20:33:24.730689', '/api/guardians/updates', 'CREDENTIALS: {}')
sky-sky-local-1  |     0.001 - SELECT (1) AS `a` FROM `sy_auth_exceptions` WHERE (`sy_auth_exceptions`.`ip_address` = '172.16.238.1' AND `sy_auth_exceptions`.`entity_id` = 217 AND `sy_auth_exceptions`.`banned` = 0 AND `sy_auth_exceptions`.`expires_at` IS NULL) LIMIT 1
sky-sky-local-1  |     0.001 - SAVEPOINT `s276728395520_x1`
sky-sky-local-1  |     0.001 - SELECT `sy_auth_exceptions`.`id`, `sy_auth_exceptions`.`entity_id`, `sy_auth_exceptions`.`ip_address`, `sy_auth_exceptions`.`banned`, `sy_auth_exceptions`.`timestamp`, `sy_auth_exceptions`.`expires_at` FROM `sy_auth_exceptions` WHERE (`sy_auth_exceptions`.`ip_address` = '172.16.238.1' AND `sy_auth_exceptions`.`entity_id` = 217) FOR UPDATE
sky-sky-local-1  |     0.001 - UPDATE `sy_auth_exceptions` SET `entity_id` = 217, `ip_address` = '172.16.238.1', `banned` = 0, `timestamp` = '2021-11-03 20:33:24.710383', `expires_at` = '2021-11-04 20:33:24.710383' WHERE `sy_auth_exceptions`.`id` = 1439
sky-sky-local-1  |     0.000 - RELEASE SAVEPOINT `s276728395520_x1`
sky-sky-local-1  |     0.001 - SELECT `sy_residences`.`id`, `sy_residences`.`name`, `sy_residences`.`domain`, `sy_residences`.`subnet`, `sy_residences`.`timezone`, `sy_residences`.`to_keep_prior_fall`, `sy_residences`.`to_keep_post_fall`, `sy_residences`.`event_policy`, `sy_residences`.`nagios_url`, `sy_residences`.`grafana_url`, `sy_residences`.`kibana_url`, `sy_residences`.`country`, `sy_residences`.`onesource_enabled`, `sy_residences`.`onesource_url`, `sy_residences`.`onesource_username`, `sy_residences`.`onesource_password`, `sy_residences`.`enable_speech_escalation`, `sy_residences`.`staff_insight_enabled`, `sy_residences`.`fall_insight_enabled`, `sy_residences`.`is_active` FROM `sy_residences` WHERE `sy_residences`.`id` IS NULL
sky-sky-local-1  |     0.002 - SELECT `sy_sensors`.`identifier`, `sy_sensors`.`is_active`, `sy_sensors`.`ip_address`, `sy_sensors`.`is_safety_check_active`, `sy_sensors`.`fast_snapshot` FROM `sy_sensors` INNER JOIN `sy_sensors_assignations` ON (`sy_sensors`.`id` = `sy_sensors_assignations`.`sensor_id`) WHERE (`sy_sensors_assignations`.`residence_id` = 87 AND `sy_sensors_assignations`.`end` IS NULL)
sky-sky-local-1  |     0.007 - SELECT `sy_alarms`.`start`, `sy_alarms`.`end`, `sy_data`.`sensor_id`, `sy_alarms`.`attachment_ptr_id` FROM `sy_alarms` INNER JOIN `sy_attachments` ON (`sy_alarms`.`attachment_ptr_id` = `sy_attachments`.`id`) INNER JOIN `sy_data` ON (`sy_attachments`.`entry_id` = `sy_data`.`id`) WHERE (`sy_data`.`residence_id` = 87 AND ((`sy_attachments`.`flags` & 16) = 16) AND `sy_alarms`.`start` >= '2021-11-02 20:33:24.761674')
sky-sky-local-1  | [03/Nov/2021 20:33:24] "GET /api/guardians/updates?format=json HTTP/1.1" 200 72
```
