insert into Users (email, password_hash) values
('alice@example.com', 'hash1'),
('bob@example.com', 'hash2'),
('carol@example.com', 'hash3'),
('dave@example.com', 'hash4'),
('eve@example.com', 'hash5');

insert into Folders (name, user_id) values
('Work', 1),
('Personal', 1),
('Ideas', 1),
('Work', 2),
('Projects', 2),
('Personal', 3),
('Travel', 3),
('Work', 4),
('Notes', 5);

insert into Tags (name) values
('urgent'),
('personal'),
('work'),
('shopping'),
('ideas'),
('travel'),
('study');

insert into Notes (title, content, is_pinned, user_id, folder_id, updated_at) values
('Finish project', 'Complete the final report by Friday', true, 1, 1, now()),
('Grocery list', 'Milk, Eggs, Bread', false, 1, 2, now()),
('Startup idea', 'An app to manage tasks', false, 1, 3, now()),
('Meeting notes', 'Discuss Q2 targets', false, 2, 4, now()),
('Project plan', 'Timeline and milestones', true, 2, 5, now()),
('Travel checklist', 'Passport, tickets, hotel', false, 3, 7, now()),
('Personal diary', 'Thoughts and reflections', false, 3, 6, now()),
('Workout plan', 'Monday: Chest, Tuesday: Legs', false, 4, 8, now()),
('Book list', 'Read: 1984, Brave New World', false, 5, 9, now()),
('Random note', 'Just a quick reminder', false, 1, null, now()),
('Shopping ideas', 'New shoes, backpack', false, 2, null, now()),
('Lecture notes', 'Chapter 5: SQL joins', false, 3, null, now()),
('Vacation ideas', 'Beach, Mountains, City trips', false, 4, null, now()),
('Recipe', 'Pasta with tomato sauce', false, 5, null, now()),
('Bug report', 'App crashes on login', true, 1, 1, now());

insert into note_tags (note_id, tag_id) values
(1, 1), -- Finish project → urgent
(1, 3), -- Finish project → work
(2, 4), -- Grocery list → shopping
(3, 5), -- Startup idea → ideas
(10, 5), -- Random note → ideas
(15, 1), -- Bug report → urgent
(15, 3); -- Bug report → work

-- Bob
insert into note_tags (note_id, tag_id) values
(4, 3), -- Meeting notes → work
(5, 3), -- Project plan → work
(11, 4); -- Shopping ideas → shopping

-- Carol
insert into note_tags (note_id, tag_id) values
(6, 6), -- Travel checklist → travel
(7, 2), -- Personal diary → personal
(12, 7); -- Lecture notes → study

-- Dave
insert into note_tags (note_id, tag_id) values
(8, 7), -- Workout plan → study (или health)
(13, 6); -- Vacation ideas → travel

-- Eve
insert into note_tags (note_id, tag_id) values
(9, 5), -- Book list → ideas
(14, 5); -- Recipe → ideas

