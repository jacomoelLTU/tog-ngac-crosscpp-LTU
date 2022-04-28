policy('test_policy_book2','Project Access', [

       user('jesper'),
       user('ilaman'),
       user('emil'),
       user('birger'),

       user_attribute('Group1'),
       user_attribute('Group2'),
       user_attribute('Library'),

       object('hobbit'),
       object('bible'),

       object_attribute('Fantasy'),
       object_attribute('Religious'),
       object_attribute('Books'),

       policy_class('Project Access'),

       connector('PM'),

       assign('jesper','Group1'),
       assign('ilaman','Group1'),
       assign('emil','Group2'),
       assign('birger','Group2'),
       assign('Group1','Library'),
       assign('Group2','Library'),
       assign('hobbit','Fantasy'),
       assign('bible','Religious'),
       assign('Fantasy','Books'),
       assign('Religious','Books'),
       assign('Library','Project Access'),
       assign('Books','Project Access'),
       assign('Project Access','PM'),

       associate('Group1',[read, write],'Fantasy'),
       associate('Group2',[read, write],'Religious')
]).
