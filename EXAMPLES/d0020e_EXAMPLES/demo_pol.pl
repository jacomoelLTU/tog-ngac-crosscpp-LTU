policy('demo_pol','Project Access', [

       user('Jesper'),
       user('Ilaman'),
       user('Emil'),
       user('Birger'),
       user('Ulf'),

       user_attribute('Group1'),
       user_attribute('Group2'),
       user_attribute('Boss'),
       user_attribute('Company'),

       object('Document1'),
       object('Document2'),
       object('Secret_Document'),

       object_attribute('Group1_Documents'),
       object_attribute('Group2_Documents'),
       object_attribute('Boss_Documents'),
       object_attribute('Documents'),

       policy_class('Project Access'),

       connector('PM'),

       assign('Jesper','Group1'),
       assign('Ilaman','Group1'),
       assign('Emil','Group2'),
       assign('Birger','Group2'),
       assign('Ulf','Boss'),
       assign('Group1','Company'),
       assign('Group2','Company'),
       assign('Boss','Company'),
       assign('Document1','Group1_Documents'),
       assign('Document2','Group2_Documents'),
       assign('Secret_Document','Boss_Documents'),
       assign('Group1_Documents','Documents'),
       assign('Group2_Documents','Documents'),
       
       assign('Boss_Documents','Project Access'),
       assign('Company','Project Access'),
       assign('Documents','Project Access'),
       assign('Project Access','PM'),

       associate('Group1',[w],'Group1_Documents'),
       associate('Group2',[w],'Group2_Documents'),
       associate('Company',[r],'Documents'),
       associate('Boss',[r, w],'Boss_Documents')
]).
