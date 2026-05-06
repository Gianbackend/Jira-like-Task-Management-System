---------  users ----------------------
delete
from USER_BELONG;
delete
from USER_ROLE;
delete
from CONTACT;
delete
from PROFILE;

delete
from ACTIVITY;
alter
    sequence ACTIVITY_ID_SEQ restart with 1;

delete
from TASK;
alter
    sequence TASK_ID_SEQ restart with 1;

delete
from SPRINT;
alter
    sequence SPRINT_ID_SEQ restart with 1;

delete
from PROJECT;
alter
    sequence PROJECT_ID_SEQ restart with 1;

delete
from REFERENCE;
alter
    sequence REFERENCE_ID_SEQ restart with 1;

delete
from USERS;
alter
    sequence USERS_ID_SEQ restart with 1;


insert into REFERENCE (REF_TYPE, CODE, TITLE, AUX, STARTPOINT)
values
    -- PROJECT = 1
    (1, 'task_tracker', 'Task tracker', null, now()),

    -- TASK = 2
    (2, 'epic', 'Epic', null, now()),
    (2, 'task', 'Task', null, now()),

    -- TASK_STATUS = 3
    -- AUX format:
    -- getAux(0) = possible next statuses
    -- getAux(1) = possible user type for assign/unassign
    (3, 'todo', 'To do', 'in_progress,canceled|', now()),
    (3, 'in_progress', 'In progress', 'ready_for_review,canceled|task_developer', now()),
    (3, 'ready_for_review', 'Ready for review', 'ready_for_test,in_progress,canceled|task_reviewer', now()),
    (3, 'ready_for_test', 'Ready for test', 'done,ready_for_review,canceled|task_tester', now()),
    (3, 'done', 'Done', '|', now()),
    (3, 'canceled', 'Canceled', '|', now()),

    -- SPRINT_STATUS = 4
    (4, 'planning', 'Planning', null, now()),
    (4, 'active', 'Active', null, now()),
    (4, 'finished', 'Finished', null, now()),

    -- USER_TYPE = 5
    (5, 'task_developer', 'Task developer', null, now()),
    (5, 'task_reviewer', 'Task reviewer', null, now()),
    (5, 'task_tester', 'Task tester', null, now()),

    -- PRIORITY = 7
    (7, 'low', 'Low', null, now()),
    (7, 'normal', 'Normal', null, now()),
    (7, 'high', 'High', null, now()),
    (7, 'critical', 'Critical', null, now());



insert into USERS (EMAIL, PASSWORD, FIRST_NAME, LAST_NAME, DISPLAY_NAME, STARTPOINT)
values ('user@gmail.com', '{noop}password', 'userFirstName', 'userLastName', 'userDisplayName', now()),
       ('admin@gmail.com', '{noop}admin', 'adminFirstName', 'adminLastName', 'adminDisplayName', now()),
       ('guest@gmail.com', '{noop}guest', 'guestFirstName', 'guestLastName', 'guestDisplayName', now()),
       ('manager@gmail.com', '{noop}manager', 'managerFirstName', 'managerLastName', 'managerDisplayName', now());


-- 0 DEV
-- 1 ADMIN
-- 2 MANAGER

insert into USER_ROLE (USER_ID, ROLE)
values (1, 0),
       (2, 0),
       (2, 1),
       (4, 2);


insert into PROFILE (ID, LAST_FAILED_LOGIN, LAST_LOGIN, MAIL_NOTIFICATIONS)
values (1, null, null, 49),
       (2, null, null, 14);


insert into CONTACT (ID, CODE, VALUE)
values (1, 'skype', 'userSkype'),
       (1, 'mobile', '+01234567890'),
       (1, 'website', 'user.com'),
       (2, 'github', 'adminGitHub'),
       (2, 'telegram', 'adminTg');



insert into PROJECT (code, title, description, type_code, parent_id, startpoint)
values ('PR1', 'PROJECT-1', 'test project 1', 'task_tracker', null, '2023-05-01 08:00:00'),
       ('PR2', 'PROJECT-2', 'test project 2', 'task_tracker', 1, '2023-05-01 08:00:00');


insert into SPRINT (status_code, startpoint, endpoint, code, project_id)
values ('finished', '2023-05-01 08:05:10', '2023-05-07 17:10:01', 'SP-1.001', 1),
       ('active', '2023-05-01 08:06:00', null, 'SP-1.002', 1),
       ('active', '2023-05-01 08:07:00', null, 'SP-1.003', 1),
       ('planning', '2023-05-01 08:08:00', null, 'SP-1.004', 1),
       ('active', '2023-05-10 08:06:00', null, 'SP-2.001', 2),
       ('planning', '2023-05-10 08:07:00', null, 'SP-2.002', 2),
       ('planning', '2023-05-10 08:08:00', null, 'SP-2.003', 2);


insert into TASK (TITLE, TYPE_CODE, STATUS_CODE, PROJECT_ID, SPRINT_ID, STARTPOINT)
values ('Data', 'epic', 'in_progress', 1, 1, '2023-05-15 09:05:10'),
       ('Trees', 'epic', 'in_progress', 1, 1, '2023-05-15 12:05:10'),
       ('task-3', 'task', 'ready_for_test', 2, 5, '2023-06-14 09:28:10'),
       ('task-4', 'task', 'ready_for_review', 2, 5, '2023-06-14 09:28:10'),
       ('task-5', 'task', 'todo', 2, 5, '2023-06-14 09:28:10'),
       ('task-6', 'task', 'done', 2, 5, '2023-06-14 09:28:10'),
       ('task-7', 'task', 'canceled', 2, 5, '2023-06-14 09:28:10');


insert into ACTIVITY(AUTHOR_ID, TASK_ID, UPDATED, COMMENT, TITLE, DESCRIPTION, ESTIMATE, TYPE_CODE, STATUS_CODE,
                     PRIORITY_CODE)
values (1, 1, '2023-05-15 09:05:10', null, 'Data', null, 3, 'epic', 'in_progress', 'low'),
       (2, 1, '2023-05-15 12:25:10', null, 'Data', null, null, null, null, 'normal'),
       (1, 1, '2023-05-15 14:05:10', null, 'Data', null, 4, null, null, null),
       (1, 2, '2023-05-15 12:05:10', null, 'Trees', 'Trees desc', 4, 'epic', 'in_progress', 'normal');


insert into USER_BELONG (OBJECT_ID, OBJECT_TYPE, USER_ID, USER_TYPE_CODE, STARTPOINT, ENDPOINT)
values (1, 2, 2, 'task_developer', '2023-06-14 08:35:10', '2023-06-14 08:55:00'),
       (1, 2, 2, 'task_reviewer', '2023-06-14 09:35:10', null),
       (1, 2, 1, 'task_developer', '2023-06-12 11:40:00', '2023-06-12 12:35:00'),
       (1, 2, 1, 'task_developer', '2023-06-13 12:35:00', null),
       (1, 2, 1, 'task_tester', '2023-06-14 15:20:00', null),
       (2, 2, 2, 'task_developer', '2023-06-08 07:10:00', null),
       (2, 2, 1, 'task_developer', '2023-06-09 14:48:00', null),
       (2, 2, 1, 'task_tester', '2023-06-10 16:37:00', null);
