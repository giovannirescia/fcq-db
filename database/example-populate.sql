set schema 'chapter6';

insert into registry values (110, current_timestamp, 110);
insert into registry values (111, current_timestamp, 111);
insert into registry values (112, current_timestamp, 112);
insert into registry values (113, current_timestamp, 113);
insert into registry values (114, current_timestamp, 114);
insert into registry values (115, current_timestamp, 115);
insert into registry values (116, current_timestamp, 116);
insert into registry values (117, current_timestamp, 117);
insert into registry values (118, current_timestamp, 118);
insert into registry values (119, current_timestamp, 119);

insert into alocation values (210, 'a', 'b');
insert into alocation values (211, 'a', 'b');
insert into alocation values (212, 'a', 'b');
insert into alocation values (213, 'a', 'b');
insert into alocation values (214, 'a', 'b');
insert into alocation values (215, 'a', 'b');
insert into alocation values (216, 'a', 'b');
insert into alocation values (217, 'a', 'b');
insert into alocation values (218, 'a', 'b');
insert into alocation values (219, 'a', 'b');

insert into chemist values (310, 'a');
insert into chemist values (311, 'aq');
insert into chemist values (312, 'aa');
insert into chemist values (313, 'aaa');
insert into chemist values (314, 'abaa');
insert into chemist values (315, 'ba');
insert into chemist values (316, 'ab');
insert into chemist values (317, 'as');
insert into chemist values (318, 'asd');
insert into chemist values (319, 'ad');

insert into checkout values (110, 210, 310, current_timestamp);
insert into checkout values (111, 212, 311, current_timestamp);
insert into checkout values (112, 210, 311, current_timestamp);
insert into checkout values (113, 210, 311, current_timestamp);
insert into checkout values (114, 213, 310, current_timestamp);
insert into checkout values (115, 210, 317, current_timestamp);
insert into checkout values (116, 213, 317, current_timestamp);
insert into checkout values (117, 210, 310, current_timestamp);
insert into checkout values (118, 214, 319, current_timestamp);
insert into checkout values (119, 210, 310, current_timestamp);
