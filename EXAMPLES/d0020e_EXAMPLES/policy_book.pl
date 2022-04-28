policy('test_policy_book','Project Access', [

       user('jesper'),
       user('ilaman'),

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
       associate('Library',[r],'Books')
]).
