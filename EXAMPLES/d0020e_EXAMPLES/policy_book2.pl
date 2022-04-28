policy('test_policy_book2','Project Access', [

       user('jesper'),
       user('ilaman'),
       user('emil'),
       user('birger'),

       user_attribute('Writer'),
       user_attribute('Reader'),
       user_attribute('Library'),

       object('hobbit'),
       object('bible'),

       object_attribute('Fantasy'),
       object_attribute('Religious'),
       object_attribute('Books'),

       policy_class('Project Access'),

       connector('PM'),

       assign('jesper','Writer'),
       assign('ilaman','Reader'),
       assign('emil','Writer'),
       assign('birger','Reader'),
       assign('jesper','Reader'),
       assign('Writer','Library'),
       assign('Reader','Library'),
       assign('hobbit','Fantasy'),
       assign('bible','Religious'),
       assign('Fantasy','Books'),
       assign('Religious','Books'),
       assign('Library','Project Access'),
       assign('Books','Project Access'),
       assign('Project Access','PM'),

       associate('Writer',[w],'Fantasy'),
       associate('Writer',[w],'Religious'),
       associate('Reader',[w],'Religious'),
       associate('Library',[r],'Books')
]).
